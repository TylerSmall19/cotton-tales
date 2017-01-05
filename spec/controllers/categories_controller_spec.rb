require 'rails_helper'

describe CategoriesController do
  let(:sample_category) { Category.create(name: "Cute") }

  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end
    it "assigns all the categories to @categories" do
      expect(assigns(:categories)).to eq(Category.all)
    end
    it "renders the :index template" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      get :show, {id: sample_category.id}
    end
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end
    it "assigns all the category to sample category" do
      expect(assigns(:category)).to eq(sample_category)
    end
    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end
end



