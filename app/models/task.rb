class Task < ActiveRecord::Base
  def date
  due_date.to_s.gsub('-','/')
  end
  belongs_to :project
  has_many :comments
  validates :description, presence: true
end
