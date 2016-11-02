require 'rails_helper'

describe Group do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :anniversary}
  end

  describe 'Associations' do
    it {should have_many :users}
    it {should belong_to :area}
  end
end
