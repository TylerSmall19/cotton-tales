require 'rails_helper'

feature "visiting the new revisions page" do
  scenario "a user sees the box to make a new revision" do
    article = Article.find_or_create_by(title: "Test-Data", body: "body", author_id: 1)
    visit ("/articles/#{article.id}/edit")
    expect(page).to have_button "Post This Revision"
  end

  #   let(:user) = { User.create!(username: "emily", password: "password") }
  #   let(:category) { Category.create!(name: "cute") }
  #   let(:article) { Article.find_or_create_by(title: "Test-Data", body: "body", author: user) }
  #   Categorization.create!(article: article, category: category)
  # end

  scenario "when logged in user makes a revision" do
    article = Article.find_or_create_by(title: "Test-Data", body: "body", author_id: 1)
    visit ("/articles/#{article.id}/edit")

    # within("#login") do
    #   fill_in "username", with: 'emily'
    #   fill_in "password", with: 'password'
    # end

    # click_button 'Login'

    within("#new_revision") do
      fill_in_ckeditor 'revision_body', with: "some text"
      click_button "Post This Revision"
    end
    expect(article.revisions.count).to be 1
    expect(article.revisions.first.author.username).to be "emily"
    expect(page).to have_current_path(article_path(article))
  end
end
