class SecretsController < ApplicationController
  before_action :authenticate

  def authenticate
    redirect_to login_path, :alert => 'You must be logged in to visit that page.' unless current_user
  end

end
