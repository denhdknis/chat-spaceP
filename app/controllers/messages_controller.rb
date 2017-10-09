class MessagesController < ApplicationController

  def index
    @groups = Group.where(id: current_user.id)
  end
end
