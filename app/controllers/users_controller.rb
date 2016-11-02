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
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      render :new
    end
  end

# GET /users/1
  def show
    @user = set_user
    @board = Board.new
    @story = Story.new
  end

# GET /users/1/edit
  def edit
    if current_user != @user
      redirect_to :back
    end
  end

# PATCH /users/1
  def update
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

# DELETE /users/1
  def destroy
    if current_user == @user
      @user.destroy
      redirect_to root_path
    else
      redirect_to current_user
    end
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
