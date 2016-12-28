class Committee < ApplicationRecord
  has_many :users
  has_many :reports

  def Committee.selector
    Rails.cache.fetch('Committee_selector', :expires_in => 5.minutes) do
      Committee.all.order(:name)
    end
  end

end
