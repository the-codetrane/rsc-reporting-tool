class Group < ApplicationRecord
  belongs_to :area
  has_many: :users
end
