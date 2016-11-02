class Area < ApplicationRecord
  has_many :users, through: :groups
end
