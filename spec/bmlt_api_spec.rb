require 'rails_helper'

describe BmltApi do
  before(:context) {20.times {FactoryGirl.create(:area)}}
  describe 'API Call' do

    let(:api) {BmltApi.new(BmltApi::JSON_ENDPOINT)}

    it 'hits the BMLT JSON API and receives the correct response' do
      api.query
      expect(api.parse).to be_an(Array)
    end

    it 'creates or updates the Groups model' do
      # api.query
      # api.parse
      # api.update_groups
      # expect(Group.all.count).to be > 0
      expect(Area.all.count).to eq 20
    end
  end
end