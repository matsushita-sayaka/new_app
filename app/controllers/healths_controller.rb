class HealthsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "health")
    @posts = Post.where(category: "けんこう").paginate(page: params[:page], per_page: 15)
  end
  
end
