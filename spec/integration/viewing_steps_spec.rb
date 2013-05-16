require 'spec_helper'

feature "Viewing steps" do
  before do
    how_to = Factory(:list, :name => "How To")
    Factory(:step,
            :list => how_to,
            :stepnum => "1",
            :description => "this is a test")

    birthday_party = Factory(:list, :name =>  "Birthday Party")
    Factory(:step,
            :list => birthday_party,
            :stepnum => "1",
            :description => "buy a balloon")
    visit '/'
  end

  scenario "Viewing steps for a given list" do
    click_link "Show"
    page.should have_content("this is a test")
    page.should_not have_content("buy a balloon")
  end
end
