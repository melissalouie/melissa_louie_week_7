class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(user_name: params[:user_name])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash.now[:alert] = 'Username and password do not match.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You are now logged out."
  end

end
