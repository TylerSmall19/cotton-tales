class RevisionsController < ApplicationController

  def index
    @article= Article.find(params[:article_id])
    @revisions = Revision.where(article_id: params[:article_id])
  end

  def show
    @revision = Revision.where(article_id: params[:article_id], id: params[:id])
  end

  def new
    @article = Article.find_by(id: params[:id]).update_article
    @revision = Revision.new
  end


  def create
    article = Article.find(params[:article_id])
    @revision = article.revisions.new(revision_params)
    p current_user
    if current_user
      @revision.author = current_user
    else
      @revision.set_author
    end
    if @revision.save
      redirect_to article_path(@revision.article)
    else
      render "new"
    end
  end

  private
  def revision_params
    params.require(:revision).permit(:body, :author)
  end

end
