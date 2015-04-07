class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :memberships
  has_many :projects, through: :memberships
  has_many :comments

  has_secure_password
end
