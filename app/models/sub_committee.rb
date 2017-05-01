class SubCommittee < ApplicationRecord
  has_many :users
  has_many :sub_committee_reports

  def SubCommittee.selector
    Rails.cache.fetch('SubCommittee_selector', :expires_in => 5.minutes) do
      SubCommittee.all.order(:name)
    end
  end

end
