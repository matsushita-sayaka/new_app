class CommentsController < ApplicationController
  before_action :authenticate_user!
  
    def create
        @comment = current_user.comments.new(comment_params)
        if @comment.save
            flash[:success] = "コメントしました"
            redirect_to :back
        else
            render post_path
        end
    end
    
    def destroy
        @comment.destroy
        redirect_to posts_path
    end
    
    private
  
      def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
      end
end