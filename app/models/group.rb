class Group < ApplicationRecord
  belongs_to :area
  has_many :users

  validates :name, presence: true
  validates :name, uniqueness: true
end
