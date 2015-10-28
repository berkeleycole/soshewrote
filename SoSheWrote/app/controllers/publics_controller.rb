class PublicsController < ApplicationController
  
  def index
    @posts = []
    Category.all.each do |category|
      last_post = category.articles.is_published?.limit(1).order(published_at: :desc).first
      @posts << last_post if last_post.present?
    end
  end
  
  def create
    @comment = Comment.new
  end
  
  def show
    @comment = Comment.new
  end
  
  def bio
    
  end
end
