class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    p params
    @article = Article.find_by(id: params[:id])
    @revisions = @article.revisions
    if @revisions
      @revision = @revisions.last
    end
  end

  # def edit
  #   @article = Article.find_by(id: params[:id])
  # end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
    if @article.save
      render 'show'
    else
      @categories = Category.all
      render 'new'
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, categories: [])
  end

end
