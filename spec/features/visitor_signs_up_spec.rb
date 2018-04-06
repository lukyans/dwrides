require "rails_helper"

RSpec.feature 'Visitor signs up' do
  scenario 'via email' do
    visit new_user_registration_path
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password Confirmation")
  end
end
