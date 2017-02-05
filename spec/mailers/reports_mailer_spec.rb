require 'rails_helper'

describe ReportsMailer do

  let(:users) {FactoryGirl.create_list(:user, 5)}
  let(:committee) {FactoryGirl.create(:committee)}
  let(:report) {FactoryGirl.create(:sub_committee_report)}
  let(:group) {FactoryGirl.create(:group)}

  before(:each) {
    users.each {|u| u.update(committee_id: committee.id, group_id: group.id)}
    report.update(committee_id: committee.id, created_by: users.first.email)
  }

  describe 'Subcommittee Reports' do

    let(:mail) {ReportsMailer.sub_committee_report_email(committee)}

    it 'sends a report to all committee members' do
      expect(mail.subject).to include("#{committee.name} Report")
      expect(mail.to).to eq(users.pluck(:email).reverse)
      expect(mail.body.encoded).to include("#{report.title}")
    end
  end

  describe 'Regional Report' do
    let(:committees) {FactoryGirl.create_list(:committee, 5)}
    let(:reports) {FactoryGirl.create_list(:sub_committee_report, 5)}
    let(:rsc_mail) {ReportsMailer.rsc_email}

    it 'aggregates all committee reports submitted' do
      expect(reports.count).to eq 5
      reports.each {|report| report.update(committee_id: committee.id, created_by: users.first.email)}
      expect(rsc_mail.subject).to include('RSC Committee Report')
      expect(rsc_mail.body.encoded).to include("#{reports.first.title}")
    end
  end
end