require 'spec_helper'

feature "Creating Steps" do
  before do
      Factory(:list, :name => "Internet Explorer")
      visit '/'
      click_link "Internet Explorer"
      click_link "New Step"
  end

  scenario "Creating a step" do
    fill_in "Description", :with => "This step is terrible!"
    click_button "Create Step"
    page.should have_content ("Ticket has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Description cannot be blank")
  end
end
