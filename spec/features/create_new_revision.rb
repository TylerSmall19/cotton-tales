require 'rails_helper'

feature "visiting the new revisions page" do

  user = User.create(username: "emily", password: "password")
  Article.create(title: "title", body: "body", author: user)

  scenario "a user sees the box to make a new revision" do
    visit ("/articles/:id/edit")
    expect(page).to have_content "New Revision"
  end

  scenario "when logged in user makes a revision" do
    it "assigns user as author to revision" do
      visit ("/articles/:id/edit")
      within("#login") do
        fill_in "username", with: 'emily'
        fill_in "password", with: 'password'
      end

      click_button 'Login'
      # click on edit button

      expect(page).to have_content "New Revision"

      let(:new_revision) {Revision.create(body: "make revision", article_id: 1, author: user)}
      expect(new_revision.author.username).to eq user.username
    end
  end
end

feature "creates a new revision and submits it and sees it as new article" do
  user = User.create(username: "Tyler", password: "password")
  article = category.articles.create(title: "Bunnies!", body: "Body of bunnies", author_id: new_user.id)
  visit ("/articles/:id/edit")
  within(".create-revision") do
    expect(page).should have_selector(:link_or_bottom, "Update")
    fill_in_ckeditor 'revision_body', with: "some text"
  end


end

scenario "the user visits a category pages, can view all linked articles and can view them" do

    visit("/categories/#{category.id}")
    within(".recent-articles") do
      expect(page).to have_content new_article.title
      click_link("Show More")
    end
    expect(page).to have_current_path article_path(new_article)
  end