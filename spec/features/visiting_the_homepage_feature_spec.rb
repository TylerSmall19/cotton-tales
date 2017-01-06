require 'rails_helper'

feature 'visiting the homepage' do

  context 'when a user is logged in' do
    scenario 'there is a link to the new article form' do
      visit '/'

      visit '/sessions/new'
      user = User.create(username: 'sam', password: 'password')

      within("#login") do
        fill_in 'username', with: 'sam'
        fill_in 'password', with: 'password'
      end

      click_button 'Login'

      expect(page).to have_content "New Bunny Tail"

      click_link 'New Bunny Tail'
      expect(page).to have_current_path('/articles/new')
    end

    scenario 'if a user is logged in, the user can log out' do
      visit '/'

      visit '/sessions/new'
      user = User.create(username: 'sam', password: 'password')

      within("#login") do
        fill_in 'username', with: 'sam'
        fill_in 'password', with: 'password'
      end

      click_button 'Login'

      expect(page).to have_content "Logout"

      click_link "Logout"

      expect(page).to have_content 'Register'
    end
  end

  context 'when no user is logged in' do
    scenario 'there is a link to the login page' do
      visit '/'

      click_link 'Login'
      expect(page).to have_current_path sessions_new_path
    end

    scenario 'there is a link to a registration page' do
      visit '/'

      click_link 'Register'
      expect(page).to have_current_path new_user_path
    end
  end

  context 'what is always on the homepage' do
    # scenario 'the user sees a list of recent articles and can view them' do
    #   most_recent_article = Article.new

    #   visit '/'

    #   expect(page).to have_content most_recent_article

    #   within("#article-list") do
    #     first(:link, "View").click
    #   end

    #   expect(page).to have_current_path(most_recent_article)
    # end

    scenario 'the user sees a list of categories and can view them' do
      cat = Category.create(name: "Cute")

      visit '/'

      expect(page).to have_content "Cute"

      within("#category-list") do
        first(:link, "Cute").click
      end

      expect(page).to have_current_path category_path(cat)
    end
  end
end
