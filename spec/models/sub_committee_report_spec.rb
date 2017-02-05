require 'rails_helper'

describe SubCommitteeReport do
  describe 'Associations' do
    it {should belong_to :committee}
    it {should have_one :user}
  end

  describe 'Model Methods' do
    let(:report) {FactoryGirl.create(:sub_committee_report)}

    it 'returns the committee the report belongs to' do
      committee = FactoryGirl.create(:committee)
      report.update(committee_id: committee.id)

      expect(report.report_committee).to eq(committee.name)

    end
  end

end
