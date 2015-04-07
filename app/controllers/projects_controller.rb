class ProjectsController < SecretsController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      if @project.memberships.create(user: current_user, role: :owner)
        redirect_to project_tasks_path(@project), notice: "Project was successfully created"
      else
        @project.destroy
        render :new
      end
    else
      render :new
    end
    membership = @project.memberships.new(user: current_user)
    membership.save
  end

  def show
  end

  def edit
  end

    def update
      if @project.update(project_params)
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :new
      end
    end

    def destroy
      if @project.destroy
        redirect_to projects_path, notice: 'Project was successfully deleted.'
      end
    end


    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
  end
