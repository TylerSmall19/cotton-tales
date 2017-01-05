require 'rails_helper'

RSpec.describe Categorization, type: :model  do
  describe Categorization do
    it "should have a article id" do
      category = Category.create(article_id: 1, category_id: 1)
      expect(category.article_id).to eq(1)
    end
    it "should have a article id" do
      category = Category.create(article_id: 1, category_id: 1)
      expect(category.category_id).to eq(1)
    end
  end
end