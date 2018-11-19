class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: :destroy
  before_action :friend_user, only: :talk
  
  def index
    @users = User.paginate(page: params[:page], per_page: 15)
    if params[:name].present?
      @users = @users.get_by_name params[:name]
    end
  end
    
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @comments = @user.comments.paginate(page: params[:page])
    @likes = @user.likes.paginate(page: params[:page])
    @like = Like.new
    @talk = Talk.new
    @ingredients = @user.ingredients.where(recipe_id: 1..64).order(:check_box)
    @friend = current_user.friends_of_user.new
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(user_id: current_user.id).each do |f|
      if Friend.find_by('user_id = ? and user_id_rq = ?', f.user_id_rq, current_user.id) 
        @friends.push(f.user_id_rq)
        @friend_status = "f"
      else
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
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  
  def friend
    @user = User.find(params[:id])
    @friend = current_user.friends_of_user.new
  end 
  
  def friends_list
    @friend = current_user.friends_of_user.new
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(user_id: current_user.id).each do |f|
      if Friend.find_by('user_id = ? and user_id_rq = ?', f.user_id_rq, current_user.id) 
        @friends.push(f.user_id_rq)
        @friend_status = "f"
      else
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
  
  def talk
    @user = User.find(params[:id])
    @talk = Talk.new
    @all = Talk.where("(written_user_id = ?) OR (written_user_id = ?)",current_user.id, @user.id)
    @talks = @all.where("(receiver_user_id = ?) OR (receiver_user_id = ?)",current_user.id, @user.id)
  end
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def friend_user
    if !current_user || @user
      redirect_to(root_path)
    end
  end
  
end
