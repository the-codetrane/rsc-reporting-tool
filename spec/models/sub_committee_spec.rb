require 'rails_helper'

describe SubCommittee do
  describe 'Validations' do
    it { should have_many :users }
    it { should have_many :sub_committee_reports}
  end
end
