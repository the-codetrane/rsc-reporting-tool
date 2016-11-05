require 'rails_helper'

describe ReportsMailer do

  let(:user) {FactoryGirl.create_list(:user, 5)}
  let(:committee) {FactoryGirl.create(:committee)}
  let(:report) {FactoryGirl.create(:report)}

  it 'sends a report to all committee members' do

  end

end