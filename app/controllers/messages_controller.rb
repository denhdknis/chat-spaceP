class MessagesController < ApplicationController
  def index
    @user = User.where
  end
end
