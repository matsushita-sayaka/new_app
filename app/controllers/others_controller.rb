class OthersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "other")
    @posts = Post.where(category: "etc...").paginate(page: params[:page], per_page: 15)
  end
  
end
