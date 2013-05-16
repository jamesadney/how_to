require 'spec_helper'

feature "Creating Steps" do
  before do
      list = Factory(:list, :name => "How To")
      visit list_path(list)
      click_link "New Step"
  end

  scenario "Creating a step" do
    fill_in "Stepnum", :with => "1"
    fill_in "Description", :with => "This step is terrible!"
    click_button "Create Step"
    page.should have_content ("Step has been created.")
  end

  scenario "Creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Stepnum can't be blank")
    page.should have_content("Description can't be blank")
  end
end
