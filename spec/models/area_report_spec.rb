require 'rails_helper'

describe AreaReport do
  let(:area_report) {AreaReport.create!(title: "New Report Title", donation: 11.50)}

  describe 'Validations' do
    it {should belong_to :area}
    it {should have_one :user}
  end

  describe "Attributes" do
    it "has a donation field" do
      expect(area_report).to have_attributes(title: "New Report Title", donation: 11.50)
    end
  end
end
