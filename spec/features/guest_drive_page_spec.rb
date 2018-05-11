require "rails_helper"

RSpec.feature "Drives", :type => :feature do
  before(:all) do
      DatabaseCleaner.clean
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)
      @user.save
    end
  # when I visit drive page
  #   I can see a drive form
  scenario "Guest should be able to visit drive page" do
    visit drives_path
    fill_in 'drive[airport]', with: 'JFK'
    select 'Two', :from => 'customSelectValidation'
    fill_in 'drive[date]', with: '04/05/2018'

    expect(page).to have_selector("input[value='JFK']")
    expect(page).to have_selector("input[value='04/05/2018']")

    click_button "Submit"
    expect(page).to have_content "Ride has been offered."
  end
end
