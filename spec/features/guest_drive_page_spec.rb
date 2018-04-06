require "rails_helper"

RSpec.feature "Drives", :type => :feature do
  let(:user) { create(:user) }
  # when I visit drive page
  #   I can see a drive form
  scenario "Guest should be able to visit drive page" do
    visit drives_path
    fill_in 'Airport', with: 'JFK'
    select 'Two', :from => 'select_spots'
    fill_in 'Date', with: '04/05/2018'

    expect(page).to have_selector("input[value='JFK']")
    expect(page).to have_selector("input[value='04/05/2018']")

    click_button "Submit"
    expect(page).to have_content "Ride has been offered."
  end
end
