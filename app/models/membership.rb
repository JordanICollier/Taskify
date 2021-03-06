class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :user_id, presence: true, uniqueness: {scope: :project_id, message: "has already been added to this project."}

  enum role: {member: 0, owner: 1}

  def self.capital_roles
    roles.map{|name, value| [name.capitalize, name]}
  end

  def last_owner?
    owner_count = Membership.where(
    role: Membership.roles[:owner],
    project: project
    ).count
    role == "owner" and owner_count < 2
  end

end
