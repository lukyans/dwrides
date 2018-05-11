require "rails_helper"

RSpec.feature "Trips", :type => :feature do
  before(:all) do
      DatabaseCleaner.clean
        # Sign in as a user.
        sign_in_as_a_valid_user
    end
  # when I visit trips page
  # I can see all trips I created
  scenario "user should be able to visit trips page" do

    ride = create(:ride)
    visit new_user_session_path

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on("Log in")

    visit trips_path

    expect(ride).to have(ride.airport)
    expect(ride).to have(ride.travelling_status)
    expect(ride).to have(ride.spot)
    expect(ride).to have(ride.date)
  end
end
