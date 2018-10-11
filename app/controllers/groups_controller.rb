class GroupsController < ApplicationController
  before_action :set_group , only: [:edit,:update]

  def index
    @groups = Group.all#current_user.groups
  end

 def new
   @group = Group.new
   @group.users << current_user
 end

 def create
   @group = Group.new(group_params)
    # binding.pry
  if @group.save
    redirect_to root_path,  notice: "グループを作成しました"
  else
    flash.now[:alert] = "グループ作成に失敗しました"
    render action: :new
  end
 end

 def edit
 end

 def update
  if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを編集しました'
  else
      render :edit
      flash.now[:alert] = "グループ編集に失敗しました"
  end
 end


 private
   def group_params
      params.require(:group).permit(:name, user_ids:[])
   end

   def set_group
     @group = Group.find(params[:id])
   end
end

