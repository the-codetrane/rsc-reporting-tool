class Group < ApplicationRecord
  belongs_to :area
  has_many :users

  validates :name, :anniversary, presence: true
  validates :name, :anniversary, uniqueness: true
end
