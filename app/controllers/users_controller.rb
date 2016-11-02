class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user) do |user, marker, infowindow|
      marker.lat @user.latitude
      marker.lng @user.longitude
      marker.infowindow @user.address
    end
  end

  def edit
    @user = User.find(params[:id])
    if !(session[:user_id] === @user.id)
      flash[:alert] = "Access Denied"
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "User updated!"
        redirect_to user_path(@user)
      else
        flash[:alert] = "Save unsuccessful, please try again! Make sure your passwords match."
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
    params.require(:user).permit(:name, :email, :phone, :address, :latitude, :longitude, :password, :photographer, :password_confirmation, category_ids:[])
  end
end
