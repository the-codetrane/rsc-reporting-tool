class Committee < ApplicationRecord
  has_many :users
  has_many :reports

end
