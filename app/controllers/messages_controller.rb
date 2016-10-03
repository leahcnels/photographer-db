class MessagesController < ApplicationController

def new
end

def create
  @user = User.find(session[:user_id])
  recipients = User.where(id: params['recipients'])
  conversation = @user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
  flash[:success] = "Message has been sent!"
  redirect_to conversation_path(conversation)
end
end
