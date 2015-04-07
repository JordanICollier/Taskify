class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships
  has_many :comments, dependent: :destroy
  enum role: {normal: 0, admin: 1}

  has_secure_password

  def owns_project?(project)
    project.memberships.find_by(
      role: Membership.roles[:owner],
      user_id: id
    ) or admin?
  end

  def projects
    if admin?
      Project.all
    else
      super
    end
  end

  def is_admin
    admin?
  end

  def is_admin=(val)
    if val
      self.role = User.roles[:admin]
    else
      self.role = User.roles[:normal]
    end
  end

end
