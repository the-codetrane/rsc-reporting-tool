class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :email, :first_name, :last_name

  belongs_to :group
  validates :email, uniqueness: true
  validates :first_name, :password, :email, presence: true
end
