class TravelsController < ApplicationController
  before_action :authenticate_user!
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "travel")
    @posts = Post.where(category: "りょこう").paginate(page: params[:page], per_page: 15)
  end
end
