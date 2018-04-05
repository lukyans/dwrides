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
    choose('Arriving')
    el = @session.find(:radio_button, 'gender_male')
    # select('Option', :from => 'Select Box')
    expect(page).to have_selector("input[value='John']")
    expect(page).to have_selector("input[value='Doe']")
    expect(page).to have_selector("input[value='JFK']")
    expect(page).to have_selector("input[value='123456']")
    expect(page).to have_selector("input[value='Arriving']")
  end
end
