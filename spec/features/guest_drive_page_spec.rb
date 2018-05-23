require "rails_helper"

RSpec.feature "Drives", :type => :feature do

  # when I visit drive page
  #   I can see a drive form
  scenario "Guest should be able to visit drive page" do
    user = FactoryBot.create(:user, :password => "123456")
    visit drives_path
    
    # visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: "123456"
    click_button('Login')
    # visit drives_path
    # expect(current_path).to eq(drives_path)
    # binding.pry
    save_and_open_page

    fill_in 'Airport', with: 'JFK'
    select 'Two', :from => 'select_spots'
    fill_in 'Date', with: '04/05/2018'


    expect(page).to have_selector("input[value='JFK']")
    expect(page).to have_selector("input[value='04/05/2018']")

    click_button "Submit"
    expect(page).to have_content "Ride has been offered."
  end
end
