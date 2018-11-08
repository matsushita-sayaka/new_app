class GoesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "go")
    @posts = Post.where(category: "おでかけ").paginate(page: params[:page], per_page: 15)
  end
end
