require 'rails_helper'

describe ReportsMailer do

  let(:users) {FactoryGirl.create_list(:user, 5)}
  let(:committee) {FactoryGirl.create(:committee)}
  let(:report) {FactoryGirl.create(:report)}
  let(:group) {FactoryGirl.create(:group)}

  describe 'Subcommittee Reports' do
    before(:each) {
      users.each {|u| u.update(committee_id: committee.id, group_id: group.id)}
      report.update(committee_id: committee.id, created_by: users.first.email)
    }
    let(:mail) {ReportsMailer.report_email(committee)}

    it 'sends a report to all committee members' do
      expect(mail.subject).to include("#{committee.name} Report")
      expect(mail.to).to eq(users.pluck(:email).reverse)
      expect(mail.body.encoded).to include("#{report.title}")
    end
  end
end

