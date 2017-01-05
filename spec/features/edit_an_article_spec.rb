#commenting out until pge is complete

# require 'rails_helper'

# feature "editing an article" do
#   let(:sample_article) { Article.create(title: "test", body: "test body", author_id: 1) }
#   scenario "the user visits the edit page" do
#     visit "/articles/#{sample_article.id}/edit"
#     expect(page).to have_content "Edit Article"
#   end

#   scenario "the user can edit the article and create a revision" do
#       visit "/articles/#{sample_article.id}/edit"
#       fill_in 'edit-body', :with => 'I got changed'
#       expect { click_link "Update" }.to change(Revision, :count).by(1)
#   end
# end
