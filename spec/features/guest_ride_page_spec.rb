require "rails_helper"

RSpec.feature "Rides", :type => :feature do
  # let(:user) { create(:user) }
  # when I visit ride page
  #   I can see a ride form

  scenario "Guest should be able to visit ride page" do
    visit rides_path
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Airport', with: 'JFK'
    fill_in 'Flight Number', with: '123456'
    choose 'Arriving'
    select 'Two', :from => 'select_spots'
    fill_in 'Date', with: '04/05/2018'

    expect(page).to have_selector("input[value='John']")
    expect(page).to have_selector("input[value='Doe']")
    expect(page).to have_selector("input[value='JFK']")
    expect(page).to have_selector("input[value='123456']")
    expect(page).to have_selector("input[value='04/05/2018']")

    click_button "Submit"
    expect(page).to have_content "Ride has been requested."
  end
end
