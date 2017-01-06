class RevisionsController < ApplicationController
# GET /articles/:article_id/revisions
  def index
    @revisions = Revision.where(article_id: params[:article_id])
  end
# GET /articles/:article_id/revisions/:id
  def show
    @revision = Revision.where(article_id: params[:article_id], id: params[:id])
  end
# GET /articles/:article_id/revisions/new
  def new
    @revision = Revision.new
  end
# POST /articles/:article_id/revisions
  def create

  end
end