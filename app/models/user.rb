class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :comments, dependent: :destroy

  has_secure_password

  def owns_project?(project)
    project.memberships.find_by(
      role: Membership.roles[:owner],
      user_id: id
    )
  end
end
