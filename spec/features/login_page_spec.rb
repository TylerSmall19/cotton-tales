require 'rails_helper'

feature 'visiting the login page' do
  scenario 'a user logs in with the correct credentials' do
    visit '/sessions/new'

    user = User.create(username: 'sam', password: 'password')

    within("#login") do
      fill_in 'username', with: 'sam'
      fill_in 'password', with: 'password'
    end

    click_button 'Login'

    expect(page).to have_current_path('/')
  end

  scenario 'a user logs in with the wrong credentials' do
    visit '/sessions/new'

    user = User.create(username: 'sam', password: 'password')

    within("#login") do
      fill_in 'username', with: 'sam'
      fill_in 'password', with: 'wrong'
    end

    click_button 'Login'

    expect(page).to have_current_path('/sessions')
    expect(page).to have_content "Login"
  end
end
