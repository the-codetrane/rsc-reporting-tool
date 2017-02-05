require 'rails_helper'

describe AreaReport do
  describe 'Validations' do
    it {should belong_to :area}
    it {should have_one :user}
  end

end
