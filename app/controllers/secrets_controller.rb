class SecretsController < ApplicationController
  before_action :authenticate

  def authenticate
    unless current_user
      session[:return_to] = request.original_url
      redirect_to login_path, :alert => 'You must be logged in to visit that page.'
    end
  end

end
