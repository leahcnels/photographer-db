class ConversationsController < ApplicationController
  before_action :get_mailbox
  before_action :get_box, only: [:index]
  before_action :get_conversation, except: [:index, :empty_trash]

  def index
    if @box.eql? "inbox"
      @conversations = @mailbox.inbox
    elsif @box.eql? "sent"
      @conversations = @mailbox.sentbox
    else
      @conversations = @mailbox.trash
    end
  end

  def show
  end

  def reply
    @user = User.find(session[:user_id])
    @user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(@user)
    flash[:success] = 'The conversation was deleted.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(@user)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(@user).update_all(deleted: true)
    end
    flash[:success] = 'Trash emptied.'
    redirect_to conversations_path
  end

private
  def get_mailbox
    @user = User.find(session[:user_id])
    @mailbox ||= @user.mailbox
  end

  def get_box
    if params[:box].blank? or !["inbox", "sent", "trash"].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end

  def get_conversation
    @user = User.find(session[:user_id])
    @mailbox ||= @user.mailbox
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
