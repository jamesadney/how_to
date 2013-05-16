require 'spec_helper'

feature "Deleting steps" do
  let!(:list) { Factory(:list) }
  let!(:step) { Factory(:step, :list => list) }


  scenario "Deleting a step" do
    visit '/'
    click_link "Show"
    click_link "Delete"
    page.should have_content("Step has been deleted.")
    page.current_url.should == list_url(list)
  end

end
