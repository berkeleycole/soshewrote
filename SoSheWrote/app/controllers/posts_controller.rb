class PostsController < ApplicationController
  before_action :category, except: [:show]
  before_action :tags, except: [:show]
  
  def index
    @posts = []
    if params[:tag].present?
      @tag = Tag.where(name: params[:tag]).limit(1).first
      @posts = @tag.articles.is_published? if @article
    else
      @posts = @category.articles.is_published? if @category
    end
    Rails.logger.info @posts
  end
  
  def show
    @post = Article.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  
  private
  
  def category
    @category ||= Category.where(name: params[:category]).limit(1).first
  end
  
  def tags
    @tags ||= @category.tags if @category.present?
  end
  
  def comments
    # @article = Article.where(params[:title]).limit(1)
  end
  
end