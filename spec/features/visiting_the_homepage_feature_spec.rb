require 'rails_helper'

feature 'visiting the homepage' do

  context 'when a user is logged in' do
    scenario 'there is a link to the new article form' do
      visit '/'

      expect(page).to have_content("#new-article")

      click_button 'New Bunny Tail'
      expect(page).to have_current_path('/articles/new')
    end

    scenario 'if a user is logged in, the user can log out' do
      visit '/'

      expect(page).to have_content("#logout")

      click "Logout"

      expect(page).to have_content 'Success'
    end
  end

  context 'when no user is logged in' do
    scenario 'the user can login' do
      background do
        User.make(username: 'samstew726', password: 'password')
      end

      visit '/'

      expect(page).to have_content("#login")

      within("#login") do
        fill_in 'Username', with: 'samstew726'
        fill_in 'Password', with: 'password'
      end

      click_button 'Sign in'
      expect(page).to have_content 'Success'
    end

    scenario 'there is a link to a registration page' do
      visit '/'

      click_link 'Register'
      expect(page).to have_current_path new_user_path
    end
  end

  context 'what is always on the homepage' do
    scenario 'the user sees a list of recent articles and can view them' do
      most_recent_article = mock_model("Article")

      visit '/'

      expect(page).to have_content most_recent_article

      within("#article-list") do
        first(:link, "View").click
      end

      expect(page).to have_current_path(most_recent_article)
    end

    scenario 'the user sees a list of categories and can view them' do
      cat = mock_model("Category")

      visit '/'

      expect(page).to have_content cat

      within("#category-list") do
        first(:link, "View").click
      end

      expect(page).to have_current_path(cat)
    end
  end
end
