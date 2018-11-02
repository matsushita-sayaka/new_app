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
    @accept_all = Friend.where(status: "accept")
    @accepts = @accept_all.where("user_id = ? OR user_id_rq = ?", current_user, current_user)
    @waits = current_user.friends.where(status: "wait"). where(user_id_rq: current_user.id)
    @keeps = current_user.friends.where(status: "wait"). where(user_id: current_user.id)
    @posts = current_user.posts.paginate(page: params[:page])
    @comments = current_user.comments
    @likes = current_user.likes
    @like = current_user.likes.new
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
  end
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
end
