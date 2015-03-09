class MembershipsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @memberships = Membership.all
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
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

private
    def membership_params
      params.require(:membership).permit(:user_id, :role)
    end

end
