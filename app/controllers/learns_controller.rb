class LearnsController < ApplicationController
  before_action :authenticate_user!
  def index
    @survey = Survey.new
    @surveys = Survey.where(category: "learn")
    @posts = Post.where(category: "がくしゅう").paginate(page: params[:page], per_page: 15)
  end
end
