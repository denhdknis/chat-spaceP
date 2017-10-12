class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    if @user.save
      redirect_to root_path,  notice: "ユーザーを更新しました"
    else
      render :edit,   alert: "ユーザー更新に失敗しました"
    end
  end

  private
   def user_params
    params.require(:user).permit(:name, :email)
   end
end
