class ApplicationController < ActionController::Base
  before_filter :authenticate_admin 
  protect_from_forgery
  helper_method :current_user

  def authenticate_admin
    unless current_user.present?
      render  'sessions/new'
    end
  end
  
  private

  def current_user
    @current_user ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  
end
