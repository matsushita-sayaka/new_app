class LifesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "life")
    @posts = Post.where(category: "くらし").paginate(page: params[:page], per_page: 15)
  end
  
end
