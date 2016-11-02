class CommentsController < ApplicationController
  before_action :find_commentable

  def new
    @comment = Comment.new
    if !session[:user_id]
      flash[:alert] = "You must be logged in to do that!"
      redirect_to log_in_path
    end
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = session[:user_id]
    if @comment.save
      flash[:success] = "Comment posted!"
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path)}
        format.js
      end
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      redirect_to posting_path(@posting)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    if !(session[:user_id] === @comment.user_id)
      flash[:alert] = "You do not have permission to edit this comment."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated!"
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    else
      flash[:alert] = "Update unsuccessful, please try again!"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:error] = "Comment deleted!"
    redirect_back(fallback_location: root_path)
  end

private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Posting.find(params[:posting_id]) if params[:posting_id]
  end
end
