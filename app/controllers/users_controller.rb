class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      raise
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :gender, :birthday, :password, :password_confirmation)
  end
  
end
