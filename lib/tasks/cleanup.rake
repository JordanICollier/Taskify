task cleanup: [:environment] do
  desc "clean up dirty data"
  # delete memberships with bad references
  Membership.all.each do |m|
    m.destroy if m.user_id.nil? or m.project_id.nil?
  end

  # delete comments with bad references
  Comment.where(task_id: nil).destroy_all

  # delete tasks with bad references
  Task.where(project_id: nil).destroy_all

end
