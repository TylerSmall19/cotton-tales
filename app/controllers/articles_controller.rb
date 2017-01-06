class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
    @revisions = @article.revisions
    @article.update_article
    p @article.body
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
      @revisions = @article.revisions
      render 'show'
    else
      @categories = Category.all
      render 'new'
    end
  end

  def search
    @articles = Article.search(params[:search]).order("created_at DESC")
    render 'results'
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, categories: [])
  end

end
