class PostingsController < ApplicationController
  def index
    @postings = Posting.all
  end

  def show
    @posting = Posting.find(params[:id])
  end

  def new
    @posting = Posting.new
    if !session[:user_id]
      flash[:alert] = "You must be logged in to do that!"
      redirect_to log_in_path
    end
  end

  def create
    @user = User.find(session[:user_id])
    @posting = @user.postings.new(posting_params)
    @postings = Posting.all
    if @posting.save
      flash[:success] = "Posting saved!"
      respond_to do |format|
        format.html { redirect_to postings_path }
        format.js
      end
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      redirect_to postings_path
    end
  end

  def edit
    @posting = Posting.find(params[:id])
    if !(session[:user_id] === @posting.user.id)
      flash[:alert] = "You do not have permission to edit this post."
      redirect_to posting_path(@posting)
    end
  end

  def update
    @posting = Posting.find(params[:id])
    if @posting.update(posting_params)
      flash[:success] = "Posting updated!"
      respond_to do |format|
        format.html { redirect_to posting_path(@posting) }
        format.js
      end
    else
      flash[:alert] = "Update unsuccessful, please try again!"
      redirect_to posting_path(@posting)
    end
  end

  def destroy
    @posting = Posting.find(params[:id])
    @posting.destroy
    flash[:error] = "Posting deleted!"
    redirect_to postings_path
  end

private
  def posting_params
    params.require(:posting).permit(:title, :body)
  end
end
