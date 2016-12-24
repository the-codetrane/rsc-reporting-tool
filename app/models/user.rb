class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group
  belongs_to :committee
  belongs_to :role

  validates :first_name, presence: true

  def na_name
    "#{self.first_name} #{self.last_name.chr}"
  end

  def can_report
    roles = Role.where.not(name: 'Member').pluck(:name)
    roles.include?(self.role.name)
  end

  def is_admin?
    self.role.name == 'Admin'
  end

end
