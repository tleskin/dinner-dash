class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user.save && @user.authenticate(params[:session][:password])
      flash[:notice] = "Succsessfulyl Logged In As #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path
    else
      flash[:error] = "Invalid Credentials. Please Try Again."
      render :new
    end
  end
end
