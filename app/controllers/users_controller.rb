class UsersController < ApplicationController

  def index
    @users = User.all
    @full
  end

  def show
  end

  def new
    @user = User.new

  end

  def edit
  end

  def destroy
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @task = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
