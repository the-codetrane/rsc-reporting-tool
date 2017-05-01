require 'rails_helper'

describe SubCommitteeReportsHelper do
  it 'returns an array of selections for SubCommittee' do
    expect(sub_committee_select).to be_a(Array)
  end

  it 'returns a signature for reports' do

    group = FactoryGirl.create(:group)
    user = FactoryGirl.create(:user)
    user.update(group_id: group.id)
    response = report_signature(user)
    expect(response).to include(user.first_name)
  end
end
