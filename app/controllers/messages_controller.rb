class MessagesController < ApplicationController
 before_action :set_group


  def index
    @message = Message.new
    @groups = Group.where(params[:group_id])
    @messages = @group.messages.includes(:user)
    @group_users = @group.users
    # binding.pry
  end

  def new
    @messages = Message.new
  end

  def create
  	#binding.pry
  	@message = @group.messages.new(messages_params)
    #binding.pry
  if @message.save!
    respond_to do |format|
     format.html {redirect_to action: 'index',  notice: "メッセージを送信しました"}
     format.json
    end
  else
    flash.now[:alert] = "メッセージ送信に失敗しました"
    redirect_to action: 'index'
  end
  end

  def set_group
  	@group = Group.find(params[:group_id])
  end

  def messages_params
  	params.require(:message).permit(:body,:image).merge(user_id: current_user.id)
  end

end