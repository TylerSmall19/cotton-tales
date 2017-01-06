require 'rails_helper'

feature "visiting an article's page" do
  let(:sample_article) { Article.create(title: "test", body: "test body", author_id: 1) }
  scenario "the user sees the listed article" do
    visit "/articles/#{sample_article.id}"
    expect(page).to have_content sample_article.title
  end

  # scenario "the user can edit the article" do
  #   visit "/articles/#{sample_article.id}"
  #   expect(page.find_link('Edit').visible?)
  #   click_link("Edit")
  #   expect(page).to have_current_path edit_article_path(sample_article)
  # end

  scenario "the user can view revision history" do
    visit "/articles/#{sample_article.id}"
    expect(page.find_link('History').visible?)
    click_link("History")
    expect(page).to have_current_path article_revisions_path(sample_article)
  end
end
