require 'rails_helper'

feature "visiting the categories page" do
  scenario "the user sees all the categories" do
    category = Category.create(:name => "Cute")
    visit('/categories')
    expect(page).to have_content 'Cute'
  end
end

feature "visiting the categories page" do
  scenario "the user sees all the articles under a category" do
    category = Category.create(:name => "Cute")
    visit("/categories/#{category.id}")
    expect(page).to have_content 'Cute'
    expect(page).to have_content 'All Categories'
  end
end

feature "visiting the categories page" do
  scenario "the user sees all the articles under a category" do
    category = Category.create(:name => "Cute")
    user = User.create(username: "emily", password: "password")
    category.articles.create!(title: "Sweeet", body: "body test", author_id: user.id)
    visit("/categories/#{category.id}")
    expect(page).to have_content "Sweeet"
    expect(page).to have_content 'All Categories'
  end

  scenario "the user visits a category pages, can view all linked articles and can view them" do
    category = Category.create(:name => "Cute")
    new_user = User.create(username: "Tyler", password: "password")
    new_article = category.articles.create(title: "Bunnies!", body: "Body of bunnies", author_id: new_user.id)
    visit("/categories/#{category.id}")
    within(".recent-articles") do
      expect(page).to have_content new_article.title
      click_link("Show More")
    end
    expect(page).to have_current_path article_path(new_article)
  end
end

