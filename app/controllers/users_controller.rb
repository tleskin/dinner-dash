class UsersController < ApplicationController

  def new
    require "pry" ; binding.pry
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "User has been successfully created!"
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages(", ").join
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    flash[:message] = "Account has been removed"
    redirect_to new_user_path # should be dashboard
  end

  private

  def user_params
    params.require(:user).permit(
                                  :name,
                                  :username,
                                  :email,
                                  :password,
                                  :password_confirmation
                                  )
  end
end
