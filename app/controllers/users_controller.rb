class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User updated!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    flash[:error] = "User deleted!"
    redirect_to root_path
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :photographer, :password_confirmation, category_ids:[])
  end
end
