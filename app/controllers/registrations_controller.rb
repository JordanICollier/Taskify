class RegistrationsController < ApplicationController

  def new
    @registration = User.new
    @submit_name = "Create User"
  end

  def create
    @registration = User.new(registration_params)

    if @registration.save
      session[:user_id] = @registration.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @registration = User.find(params[:id])
    if @registration.destroy
      redirect_to users_path, notice: 'User was successfully deleted.'
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
