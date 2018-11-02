class StaticPagesController < ApplicationController
  def home
    @sentence = Sentence.pluck(:proverb, :speaker).sample
    @posts = Post.limit(12)
  end
end
