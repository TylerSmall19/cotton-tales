require 'rails_helper'

describe RevisionsController do
  let(:user) {User.create(username: "em", password: "p")}
  let(:sample_revision) {Revision.create(body: "Revision body", article_id: 1, author_id: 1)}

  describe "GET #index" do
    before(:each) do
      get :index, {article_id: 1}
    end
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end
    # it "assigns all revisions to @revisions" do
    #   # revision = Revision.create(body: "Revision body", article_id: 1, author_id: 1)
    #   expect(assigns(:revisions)).to eq(sample_revision)
    # end
    it "renders the :index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, {id: sample_revision.id, article_id: 1}
    end
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end
    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    context "when valid parameters are passed" do
      before(:each) do
      end
      it "responds with status 302" do
        expect(response).to have_http_status 200
      end
      it "creates a new revision in the database" do
        revision =  Revision.create(body: "test body", article_id: 1, author_id: 1)
        expect(revision.save).to be true
      end
      it "assigns the newly created revision as @revision" do
        revision =  Revision.create(body: "test body", article_id: 1, author_id: 1)
        expect(revision).to eq(Revision.last)
      end
    end
  end
end
