class GroupsController < ApplicationController


  def index
    @groups = Group.where(id: current_user.id)
  end

 def new
   @group = Group.new
 end

 def create
   @group = Group.new(group_params)
  if @group.save
    redirect_to root_path,  notice: "グループを作成しました"
  else
    render :new,   alert: "グループ作成に失敗しました"
  end
 end

 def edit
  @group = Group.find(params[:id])
 end

 def update
  group = Group.find(params[:id])
  if group.id == current_user.id
     group.update(group_params)
     redirect_to root_path,  notice: "グループを更新しました"
  else
       render :edit,   alret: "グループ更新に失敗しました"
  end
 end


 private
   def group_params
      params.require(:group).permit(:name, :user_id)
   end

end
