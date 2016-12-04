require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
  end

  describe 'Associations' do
    it { should belong_to :group }
  end

  describe 'Instance Methods' do
    let(:user) {FactoryGirl.create(:user)}
    let(:role) {FactoryGirl.create(:role)}
    let(:admin) {FactoryGirl.create(:admin)}

    it 'Displays NA Name' do
      expect(user.na_name).to eq("#{user.first_name} #{user.last_name.chr}")
    end

    it 'Allows approved members to publish reports' do
      user.update(role: admin)
      expect(user.can_report).to eq true
    end

    it 'Prevents unauthorized members from publishing' do
      user.update(role: role)
      expect(user.can_report).to eq false
    end
  end
end
