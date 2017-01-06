require 'rails_helper'

feature "creating an article" do
  scenario "the user visits the create page" do
    visit "articles/new"
    expect(page).to have_content "New Article"
  end
  scenario "the user can add information and create a new article" do
    Category.create!(name: "cute")
    u = User.create!(username: "test", password: "password")

    visit '/'

    within("#login") do
      fill_in 'username', with: 'test'
      fill_in 'password', with: 'password'
    end

    click_button 'Login'

    visit "articles/new"
    fill_in 'article_title', :with => 'Test'
    fill_in 'article_body', :with => 'Test Body'

    page.check "cute"
    click_button 'Create Article'

    p Article.all
    save_and_open_page
    expect(Article.count).to be 1
    expect(Article.last.categories.count).to be 1
    expect(Article.last.categories.first.name).to eq 'cute'
  end
end
