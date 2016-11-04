class UsersController < ApplicationController
  rescue_from ActionController::RedirectBackError, with: :redirect_to_default
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
      log_in @user
      flash[:success] = "Welcome to FamBook!"
      redirect_to @user
    else
      render :new
    end
  end

# GET /users/1
  def show
    @user = User.find(params[:id])
    @board = Board.new
    @story = Story.new
  end

# GET /users/1/edit
  def edit
  end

# PATCH /users/1
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path
    else
      render :edit
    end
  end

# DELETE /users/1
  def destroy
    @user.destroy
      redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :mobile, :address, :dob,  :password, :password_confirmation)
    end

    def redirect_to_default
      redirect_to root_path
    end
end
