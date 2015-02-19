class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome back, stranger!'
    else
      flash[:login_alert] = "Username / password combination is invalid"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "We're sorry to see you go!"
  end

end
