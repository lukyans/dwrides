require "rails_helper"

RSpec.feature 'Visitor signs in' do
  scenario 'via email' do
    visit new_user_session_path
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end
end
