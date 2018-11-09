class FriendsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @friend = Friend.new(friend_params)
    if @friend.save
        flash[:success] = "友達リクエストを送りました"
        redirect_to users_path
    else
        render :back
    end
  end
  
  private
  
  def friend_params
    params.require(:friend).permit(:user_id_rq, :user_id, :message)
  end
  
end