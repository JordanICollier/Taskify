class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
