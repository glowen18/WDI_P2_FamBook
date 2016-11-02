class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
      log_in user
      # session[:user_id] = user.id.to_s
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid email/password combo'
     render :new
   end
  end

  def edit
    user = User.find_by(params[:id])
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
