class WelcomeController < ApplicationController

  def index
    @errors = params[:errors]
    @articles = Article.all
    @categories = Category.all
  end
end
