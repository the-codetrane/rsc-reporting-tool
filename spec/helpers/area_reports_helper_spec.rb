require 'rails_helper'

describe AreaReportsHelper do
  describe '#report_signature' do
  it 'returns a signature for reports' do
      group = FactoryGirl.create(:group)
      user = FactoryGirl.create(:user)
      user.update(group_id: group.id)
      response = report_signature(user)
      expect(response).to include(user.first_name)
    end
  end
end
