class UsersController < SecretsController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:create]
  before_action :set_collaborators, only: [:index, :show]
  before_action :assert_current_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
    @full
  end

  def show

  end

  # def new
  #   @user = User.new
  #   @submit_name = "Create User"
  # end

  def edit

    @submit_name = "Update User"
  end

  def destroy
    @user.destroy
    if @user.id == current_user.id
      session[:user_id] = nil
      redirect_to root_path, notice: "User was successfully deleted."
    else
      redirect_to users_path, notice: 'User was successfully deleted.'
    end
  end

  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     redirect_to users_path, notice: 'User was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def set_collaborators
      @collaborators = current_user.projects.flat_map{|project| project.users}
    end

    def assert_current_user
      if current_user != @user
        render file: "public/404", layout: false, status: :not_found
      end
    end

end
