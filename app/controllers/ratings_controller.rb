class RatingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    if !session[:user_id]
      flash[:alert] = "You must be logged in to do that!"
      redirect_to log_in_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @rating = @user.ratings.new(rating_params)
    @rating.author_id = session[:user_id]
    if @rating.save
      flash[:success] = "Rating saved!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      redirect_to new_user_rating_path(@user)
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    if !(session[:user_id] === @rating.author_id)
      flash[:alert] = "You do not have permission to edit this post."
      redirect_to user_path(@rating.user_id)
    end
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      flash[:success] = "Rating updated!"
      redirect_to user_path(@rating.user_id)
    else
      flash[:alert] = "Update unsuccessful, please try again!"
      redirect_to edit_user_rating_path(@rating.user_id, @rating)
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    flash[:error] = "Rating deleted!"
    redirect_to user_path(@rating.user_id)
  end

private
  def rating_params
    params.require(:rating).permit(:stars, :feedback)
  end
end
