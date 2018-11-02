class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
  
  def index
    @posts = Post.paginate(page: params[:page], per_page: 15)
    @like = current_user.likes.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
    @post.post_details.build
  end

  def show
    @post = Post.find(params[:id])
    @comment = current_user.comments.new
    @like = current_user.likes.new
    @comments = @post.comments.paginate(page: params[:page], per_page: 15)
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = "投稿できました！"
      redirect_to posts_path
    else
      render new_post_path
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path
    else 
      render :back
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:category, :title, :main_content, :user_id, post_details_attributes: [:id, :post_id, :content, :image, :_destroy])
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
  
end
