class Role < ApplicationRecord
  has_many :users

  def Role.selector
    Rails.cache.fetch('roles_selector', :expires_in => 5.minutes) do
      Role.all.order(:name)
    end
  end

end
