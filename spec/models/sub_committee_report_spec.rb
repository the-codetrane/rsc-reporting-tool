require 'rails_helper'

describe SubCommitteeReport do
  describe 'Associations' do
    it {should belong_to :sub_committee}
    it {should have_one :user}
  end

  describe 'Model Methods' do
    let(:report) {FactoryGirl.create(:sub_committee_report)}

    it 'returns the committee the report belongs to' do
      sub_committee = FactoryGirl.create(:sub_committee)
      report.update(sub_committee_id: sub_committee.id)

      expect(report.report_committee).to eq(sub_committee.name)

    end

  end

end
