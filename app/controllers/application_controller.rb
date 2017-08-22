class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  helper_method :current_user

  def current_user
  	@user = User.find_by(id: session[:user_id])
  end

  def logged_in?
  	session[:user_id] != nil
  end

  def require_logged_in
  	return redirect_to root_path unless logged_in?
  end

  def welcome
  end
end
