require 'rails_helper'

describe SubCommitteeReport do
  describe 'Associations' do
    it {should belong_to :sub_committee}
    it {should have_one :user}
  end

  describe 'Model Methods' do
    let(:sub_committee) {FactoryBot.create(:sub_committee)}

    it 'returns the committee the report belongs to' do
      report = FactoryBot.create(:sub_committee_report, sub_committee_id: sub_committee.id)
      expect(report.report_committee).to eq(sub_committee.name)

    end

  end

end
