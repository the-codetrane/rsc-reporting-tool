class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
  belongs_to :committee
  validates :first_name, presence: true

  def na_name
    "#{self.first_name} #{self.last_name.chr}"
  end
end
