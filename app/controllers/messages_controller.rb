class MessagesController < ApplicationController

  def index
    @messages = Message.new
    @groups = Group.all#current_user.groups
  end

  def new
    @messages = Message.new
  end

  def create
    @messages = Message.create(body: message_params[:body], image: message_params[:image], user_id: current_user.id)
  if @messages.save!
    redirect_to action: 'index',  notice: "メッセージを送信しました"
  else
    flash.now[:alert] = "メッセージ送信に失敗しました"
    redirect_to action: 'index'
  end
  end


  def message_params
    params.require(:message).permit(:body,:image)
  end
end