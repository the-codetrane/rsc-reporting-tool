require 'rails_helper'

describe ReportsHelper do
  it 'returns an array of selections for Committee' do
    expect(committee_select).to be_a(Array)
  end

  it 'returns a signature for reports' do

    group = FactoryGirl.create(:group)
    user = FactoryGirl.create(:user)
    user.update(group_id: group.id)
    response = report_signature(user)
    expect(response).to include(user.first_name)
  end
end
