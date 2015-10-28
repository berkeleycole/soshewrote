class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
  
  http_basic_authenticate_with :name => "alyssa", :password => "secret", :except => [:index, :show]

  def index
    @articles = Article.all
    @tags = Tag.all
    @categories = Category.all
    
    if params[:category]
      @articles = Article.where(category: params[:category.name])
    else
      @articles = Article.all
    end
    
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit
    
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    Rails.logger.info ":::PARAMS:::"
    Rails.logger.info params
    Rails.logger.info "::::::::"
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      set_published_at
      params.require(:article).permit(:title, :content, :category_id, :published)
    end
    
    def set_published_at
      if params[:article][:published] == "1" and @article.published == false
        @article.published_at = Time.now
      end
    end
end
