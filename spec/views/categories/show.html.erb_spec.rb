require 'rails_helper'

describe 'categories/show.html.erb' do
  it "displays nothing if there are no categories" do
    assign(:category, Category.create(name: "Bunnies"))
    render
    rendered.should have_content("No articles to display")
  end

  it "displays the category name correctly" do
    assign(:category, Category.create(name: "Bunnies"))
    render
    rendered.should have_content("Bunnies")
  end
end