class AdminsController < ApplicationController
  skip_filter :authenticate_admin 

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
