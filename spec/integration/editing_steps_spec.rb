require 'spec_helper'

feature "Editing steps" do
  let!(:list) { Factory(:list) }
  let!(:step) { Factory(:step, :list => list) }

  before do
    visit '/'
    click_link "Show"
    click_link "Edit"
  end

  scenario "Updating a step" do
    fill_in "Description", :with => "Actually, this is a super test."
    click_button "Update Step"
    page.should have_content "Step has been updated."
    within("#step li") do
      page.should have_content("Actually, this is a super test.")
    end
      page.should_not have_content step.description
  end


  scenario "Updating a step with invalid information" do
    fill_in "Description", :with => ""
    click_button "Update Step"
    page.should have_content "Step has not been updated."
  end
end
