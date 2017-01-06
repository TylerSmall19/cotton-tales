require 'rails_helper'

RSpec.describe Revision, type: :model do
  let(:author) { User.create(username: "barry", password: "password")}
  let(:category) {Category.create(name: "All")}
  let(:article) {Article.create(title: "Test Title", body: "test body", )}
  let(:revision) { Revision.create(body: "test body", article_id: article.id, author_id: author.id) }
  let(:revision_two) { Revision.new(body: "test body", article_id: article.id) }
  describe Revision do
    it "should have a body" do
      expect(revision.body).to eq("test body")
    end
    it "should have belong to an article" do
      expect(revision.article_id).to eq(article.id)
    end
    it "should have belong to an author" do
      expect(revision.author_id).to eq(author.id)
    end
    it "should be created with a random author" do
      count = Revision.all.count
      revision = Revision.create(body: "test body", article_id: 1, author_id: 1)
      expect(Revision.count).to eq(count+1)
    end
  end
end
