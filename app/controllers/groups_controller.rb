class GroupsController < ApplicationController
 

  def index
    @groups = Group.all#current_user.groups
  end

 def new
   @group = Group.new
 end

 def create
   @group = Group.new(group_params)
   #binding.pry
  if @group.save
    @group.users << User.where(id: params[:group][:user_ids])
    redirect_to root_path,  notice: "グループを作成しました"
  else
    flash.now[:alert] = "グループ作成に失敗しました"
    render action: :new
  end
 end

 def edit
  @group = Group.find(params[:id])
 end

 def update
  @group = Group.find(params[:id])
  if @group.update(group_params)
      @group.users << User.where(id: params[:group][:user_ids])
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
  else
      render :edit
      flash.now[:alert] = "グループ編集に失敗しました"
  end
 end


 private
   def group_params
      params.require(:group).permit(:name, :user_id)
   end
end
