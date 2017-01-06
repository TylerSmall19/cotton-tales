require 'rails_helper'

feature "visiting the article index page" do
  scenario "The user can see a list of all the articles" do
    visit "/articles"
    expect(page).to have_content "All Articles"
    expect(page.has_selector?('ul.articles-list'))
  end

  xscenario "The User can visit the page of a specific article" do
  end
end
