require 'rails_helper'

describe User do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :first_name }
  end

  describe 'Associations' do
    it { should belong_to :group }
  end
end
