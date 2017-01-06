require 'rails_helper'

feature "visiting the article index page" do
  scenario "The user can visit the page that lists all the articles" do
    visit "/articles"
    expect(page).to have_content "All Articles"
  end

  xscenario "The User can visit the page of a specific article" do
  end
end
