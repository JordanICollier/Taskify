class MembershipsController < SecretsController
  before_action :set_project
  def index
    @project = Project.find(params[:project_id])
    @memberships = @project.memberships
    @membership = Membership.new
  end

  def new
    @project = Project.find(params[:project_id])
    @membership = Membership.new
  end

  def create
    @project = Project.find(params[:project_id])
    @membership = Membership.new(membership_params)
    @membership.project_id = @project.id
    @membership.user_id
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully added."
    else
      render :index
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @membership = Membership.find(params[:id])
    if @membership.last_owner?
      flash.now[:alert] = "Projects must have at least one owner."
      render :index
    elsif @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated."
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    membership = Membership.find(params[:id])
    membership.destroy
    if membership.user_id == current_user.id
      redirect_to projects_path, notice: "#{current_user.full_name} successfully removed"
    else
      redirect_to project_memberships_path(@project), notice: 'User was successfully deleted.'
    end
  end

private
    def membership_params
      params.require(:membership).permit(:user_id, :role)
    end

    def set_project
      @project = Project.find(params[:project_id])
      unless @project and @project.users.include? current_user
        redirect_to projects_path,
        alert: "You do not have access to that project"
      end
    end
end
