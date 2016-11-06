require 'rails_helper'

describe ReportsMailer do

  let(:users) {FactoryGirl.create_list(:user, 5)}
  let(:committee) {FactoryGirl.create(:committee)}
  let(:report) {FactoryGirl.create(:report)}

  describe 'Subcommittee Reports' do
    before(:each) {
      users.each {|u| u.update(committee_id: committee.id)}
      report.update(committee_id: committee.id)
    }
    let(:mail) {ReportsMailer.report_email(committee)}

    it 'sends a report to all committee members' do
      expect(mail.subject).to include("#{committee.name} Report")
      expect(mail.to).to eq(users.pluck(:email).reverse)
    end
  end
end

