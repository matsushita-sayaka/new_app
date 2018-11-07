class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page], per_page: 15)
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
  end
    
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts.paginate(page: params[:page])
    @comments = current_user.comments.paginate(page: params[:page])
    @likes = current_user.likes.paginate(page: params[:page])
    @like = Like.new
    @ingredients = current_user.ingredients.where(recipe_id: 1..64).order(:check_box)
    @friend = current_user.friends.new
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(user_id: current_user.id).each do |f|
      if Friend.find_by('user_id = ? and user_id_rq = ?', f.user_id_rq, current_user.id) 
      logger.debug("--------------------- 友達　f.user_id_rq = #{f.user_id_rq}")
        @friends.push(f.user_id_rq)
        @friend_status = "f"
       logger.debug("--------------------- 友達　#{@friend_status}") 
      else
      logger.debug("--------------------- 申請中f.user_id_rq = #{f.user_id_rq}")
        
        @request_friends.push(f.user_id_rq)
        @friend_status = "r"
logger.debug("--------------------- 申請中　#{@friend_status}") 
      end
    end
    
    Friend.where(user_id_rq: current_user.id).each do |f|
      if !Friend.find_by('user_id = ? and user_id_rq = ?', current_user.id, f.user_id) 
      logger.debug("--------------------- 承認待ち　f.user_id_rq = #{f.user_id}")
        	@receive_friends.push(f.user_id)
    	    @friend_status = "w"

      end
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def friend
    @user = User.find(params[:id])
    @friend = current_user.friends.new
  end 
  
  def friends_list
    @friend = current_user.friends.new
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(user_id: current_user.id).each do |f|
      if Friend.find_by('user_id = ? and user_id_rq = ?', f.user_id_rq, current_user.id) 
      logger.debug("--------------------- 友達　f.user_id_rq = #{f.user_id_rq}")
        @friends.push(f.user_id_rq)
        @friend_status = "f"
        
      else
      logger.debug("--------------------- 申請中f.user_id_rq = #{f.user_id_rq}")
       
        @request_friends.push(f.user_id_rq)
        @friend_status = "r"

      end
    end
    
    Friend.where(user_id_rq: current_user.id).each do |f|
      if !Friend.find_by('user_id = ? and user_id_rq = ?', current_user.id, f.user_id) 
      logger.debug("--------------------- 承認待ち　f.user_id_rq = #{f.user_id}")
        	@receive_friends.push(f.user_id)
    	    @friend_status = "w"

      end
    end
  end
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
end
