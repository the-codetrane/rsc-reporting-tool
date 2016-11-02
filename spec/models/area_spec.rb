require 'rails_helper'

describe Area do

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'Associations' do
    it { should have_many :groups }
    it { should have_many :users }
  end
end
