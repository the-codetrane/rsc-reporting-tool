class Group < ApplicationRecord
  belongs_to :area
  has_many :users

  validates :name, presence: true
  validates :name, uniqueness: true

  def Group.selector
    Rails.cache.fetch('group_selector', :expires_in => 5.minutes) do
      Group.all.order(:name)
    end
  end
end
