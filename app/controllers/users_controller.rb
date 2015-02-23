class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User successfully created."
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Project successfully updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user == User.find(current_user.id)
      redirect_to users_path, alert: "Cannot delete user when signed in."
    else
      @user.destroy
      flash[:notice] = "User successfully deleted."
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :about, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
