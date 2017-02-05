class Area < ApplicationRecord
  has_many :groups
  has_many :users, through: :groups
  has_many :area_reports

  validates :name, presence: true
  validates :name, uniqueness: true
end
