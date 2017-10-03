class GroupsController < ApplicationController

 def new
   @group = Group.new
 end

 def create
   @group = Group.create(group_params)
  if @group.save
    flash[:notice] = "グループを作成しました"
    redirect_to root_path
  else
    render action: :new
  end
 end

 def edit
 end


 private
   def group_params
      params.require(:group).permit(:name, :user_id)
   end

end
