class CooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "cook")
    @posts = Post.where(category: "りょうり").paginate(page: params[:page], per_page: 15)
  end
  
end
