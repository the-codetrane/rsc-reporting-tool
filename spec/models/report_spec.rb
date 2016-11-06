require 'rails_helper'

describe Report do
  describe 'Validations' do
  it {should belong_to :committee}
  end

  describe 'Model Methods' do
    let(:report) {FactoryGirl.create(:report)}

    it 'returns the committee the report belongs to' do
      committee = FactoryGirl.create(:committee)
      report.update(committee_id: committee.id)

      expect(report.report_committee).to eq(committee.name)

    end
  end

end
