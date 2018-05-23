require "rails_helper"

RSpec.feature "Rides", :type => :feature do
  before(:each) do
      DatabaseCleaner.clean
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      user.save
    end
  # when I visit ride page
  #   I can see a ride form

  scenario "Guest should be able to visit ride page" do
    visit rides_path
    fill_in 'Airport', with: 'JFK'
    fill_in 'Flight Number', with: '123456'
    choose 'Arriving'
    select 'Two', :from => 'customSelectValidation'
    fill_in 'Date', with: '04/05/2018'

    # expect(page).to have_selector("input[value='JFK']")
    # expect(page).to have_selector("input[value='123456']")
    # expect(page).to have_selector("input[value='04/05/2018']")

    click_button("Submit")
    # save_and_open_page
    expect(current_path).to eq(root_path)
    expect(page).to have_content "Ride has been requested."
  end
end
