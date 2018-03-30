require "rails_helper"

RSpec.feature 'Visitor signs up' do
  scenario 'via email' do
    visit sign_up_path
    expect(page).to have_content("First name")
  end
end
