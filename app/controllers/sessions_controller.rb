class SessionsController < ApplicationController
  before_filter :authenticate_admin ,:except => [:new,:create]
  def new
  end

  def create
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
