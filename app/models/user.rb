class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, :last_name, :email, presence: true 
end
