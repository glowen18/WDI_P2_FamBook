class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params.require(:user).permit(:name, :email, :mobile, :address, :dob, :password, :password_confirmation))
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy

  end

private
  def user_params
    params.require(:user).permit(:name, :email, :mobile, :address, :dob, :password, :password_confirmation)
  end
end
