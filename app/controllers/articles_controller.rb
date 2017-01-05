class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    @article = Article.new(title: params[:article][:title], body: params[:article][:body], author_id: session[:id])
    if @article.save
      render 'show'
    else
      render 'new'
    end
  end

end
