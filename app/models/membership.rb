class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :user_id, presence: true, uniqueness: {scope: :project_id, message: "has already been added to this project."}

  enum role: {member: 0, owner: 1}

  def self.capital_roles
    roles.map{|name, value| [name.capitalize, name]}
  end

end
