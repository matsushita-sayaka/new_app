class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
      @like = current_user.likes.create!(like_params)
      redirect_to :back
  end
  
  def destroy
    @like = current_user.likes.find_by(post_id: params[:id])
    @like.destroy
    redirect_to :back
  end
  
  private
  
  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
  
end