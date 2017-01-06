class RevisionsController < ApplicationController
# GET /articles/:article_id/revisions
  def index
    @article= Article.find(params[:article_id])
    @revisions = Revision.where(article_id: params[:article_id])
  end
# GET /articles/:article_id/revisions/:id
  def show
    @revision = Revision.where(article_id: params[:article_id], id: params[:id])
  end
# GET /articles/:article_id/revisions/new (also edit article)
  def new
    @article = Article.find_by(id: params[:id]).update_article
    @revision = Revision.new
  end

# POST /articles/:article_id/revisions
  def create
    article = Article.find(params[:article_id])
    @revision = article.revisions.new(revision_params)
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
