class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
      @comment = current_user.comments.new(comment_params)
      if @comment.save
          flash[:success] = "コメントしました"
          redirect_back(fallback_location: root_path)
      else
          render post_path
      end
  end
  
  
  private

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
      
end