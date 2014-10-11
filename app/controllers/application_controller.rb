class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method [:logged_in?, :admin] # logged_in? methods available as helper method

  def logged_in?
  	# use current_user method to check if current_user is nil - if nil, not logged in
  	!current_user.nil?
  end

  #if not logged in, redirect to login page
  def auth
    #redirect to login page unless already logged in
    redirect_to new_user_session_path, alert: "You must login to access that page" unless logged_in?
  end

  #check if an admin is logged in, else redirect to root
  def authorise_admin
    redirect_to root_path, alert: "You are not authorised to access that page" if current_user.try(:admin?) != true
  end
end
