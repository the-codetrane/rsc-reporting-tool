require 'rails_helper'

describe Committee do
  describe 'Validations' do
    it { should have_many :users }
  end
end
