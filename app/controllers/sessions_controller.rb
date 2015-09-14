class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
        flash[:notice] = "Succsessfully Logged In As #{@user.username}"
        session[:user_id] = @user.id
        redirect_to user_path
    else
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.admin? && @user.authenticate(params[:session][:password])
        flash[:notice] = "Succsessfully Logged In As #{@user.username}"
        session[:user_id] = @user.id
        redirect_to admin_dashboard_path
      elsif @user && @user.authenticate(params[:session][:password])
        flash[:notice] = "Succsessfully Logged In As #{@user.username}"
        session[:user_id] = @user.id
        redirect_to user_path
      else
        flash[:error] = "Invalid Credentials. Please Try Again."
        render :new
      end
    end
  end

  def twitter
    redirect_to '/auth/twitter'
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end
