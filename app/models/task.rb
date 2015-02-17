class Task < ActiveRecord::Base
  def date
  due_date.to_s.gsub('-','/')
  end

  validates :description, presence: true
end
