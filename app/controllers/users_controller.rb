class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]

# GET /users
  def index
    @users = User.all
  end

# GET /users/new
  def new
    @user = User.new
  end

# POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

# GET /users/1
  def show
    @user = User.find(params[:id])
  end

# GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end

# PATCH /users/1
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params.require(:user).permit(:name, :email, :mobile, :address, :dob, :password, :password_confirmation))
      redirect_to users_path
    else
      render :edit
    end
  end

# DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      redirect_to root_path
    else
      redirect_to current_user
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :mobile, :address, :dob, :password, :password_confirmation)
  end
end
