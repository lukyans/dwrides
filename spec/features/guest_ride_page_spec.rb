require "rails_helper"

RSpec.feature "Ride", :type => :feature do
  let(:user) { create(:user) }
  # when I visit ride page
  #   I can see a ride form

  scenario "Guest should be able to visit ride page" do
    visit "/ride"
    expect(page).to have_selector("input", :value =>"First Name")
  end
end
