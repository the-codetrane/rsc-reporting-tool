require 'rails_helper'

describe ReportsMailer do

  let(:users) { FactoryBot.create_list(:user, 5) }
  let(:sub_committee) { FactoryBot.create(:sub_committee) }
  let(:report) { FactoryBot.create(:sub_committee_report, sub_committee_id: SubCommittee.last.id) }
  let(:group) { FactoryBot.create(:group) }
  let(:area) { FactoryBot.create(:area) }

  before(:each) {
    users.each { |u| u.update(sub_committee_id: sub_committee.id, group_id: group.id) }
    report.update(sub_committee_id: sub_committee.id, created_by: users.first.email)
  }

  describe 'Subcommittee Reports' do
    let(:mail) { ReportsMailer.sub_committee_report_email(sub_committee) }

    it 'sends a report to all sub_committee members' do
      expect(mail.subject).to include("#{sub_committee.name} Report")
      expect(mail.to).to eq(users.pluck(:email).reverse)
      expect(mail.body.encoded).to include("#{report.title}")
    end
  end

  describe 'Area Reports' do
    let(:mail) { ReportsMailer.area_report_email(area) }

    it 'sends a report to all sub_committee members' do
      expect(mail.subject).to include("#{area.name} Report")
      expect(mail.to).to eq(users.pluck(:email).reverse)
      expect(mail.body.encoded).to include("#{area.title}")
    end
  end

  describe 'Regional Report' do
    let(:sub_committees) { FactoryBot.create_list(:sub_committee, 5) }
    let(:reports) { FactoryBot.create_list(:sub_committee_report, 5, sub_committee_id: SubCommittee.last.id) }

    it 'aggregates all sub_committee reports submitted' do
      expect(reports.count).to eq 5
      reports.each { |report| report.update(sub_committee_id: sub_committees.first.id, created_by: users.first.email) }
      rsc_mail = ReportsMailer.rsc_email
      expect(rsc_mail.subject).to include('RSC Sub-Committee Report')
      expect(rsc_mail.body.encoded).to include("#{reports.first.title}")
    end
  end
end

