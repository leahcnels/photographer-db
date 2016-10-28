class CommentsController < ApplicationController
  def index
    @posting = Posting.find(params[:posting_id])
    @comments = @posting.comments.all
  end

  def new
    @posting = Posting.find(params[:posting_id])
    @comment = Comment.new
    if !session[:user_id]
      flash[:alert] = "You must be logged in to do that!"
      redirect_to log_in_path
    end
  end

  def create
    @user = User.find(session[:user_id])
    @posting = Posting.find(params[:posting_id])
    @comment = @posting.comments.new(comment_params)
    @comment.user_id = @user.id
    if @comment.save
      flash[:success] = "Comment posted!"
      respond_to do |format|
        format.html { redirect_to posting_path(@posting) }
        format.js
      end
    else
      flash[:alert] = "Save unsuccessful, please try again!"
      redirect_to posting_path(@posting)
    end
  end

  def edit
    @posting = Posting.find(params[:posting_id])
    @comment = Comment.find(params[:id])
    if !(session[:user_id] === @comment.user_id)
      flash[:alert] = "You do not have permission to edit this comment."
      redirect_to posting_path(@posting)
    end
  end

  def update
    @posting = Posting.find(params[:posting_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated!"
      @comment.title = @comment.title + " *edited"
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
    @posting = Posting.find(params[:posting_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:error] = "Comment deleted!"
    redirect_to posting_path(@posting)
  end

private
  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
