#commenting out until we have pages up and running

# require 'rails_helper'

# feature "creating an article" do
#   scenario "the user visits the create page" do
#     visit "articles/new"
#     expect(page).to have_content "New Article"
#   end
#   scenario "the user can add information and create a new article" do
#     visit "articles/new"
#     fill_in 'article_title', :with => 'Test'
#     fill_in 'article_body', :with => 'Test Body'
#     find(:css, "#cute").set(true)
#     expect{ click_link "Create" }.to change(Article, :count).by(1)
#   end
# end
