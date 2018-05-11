# This module authenticates users for request specs.#
module ValidUserRequestHelper
    # Define a method which signs in as a valid user.
  def sign_in_as_a_valid_user
      # ASk factory bot to generate a valid user for us.
      @user ||= create :user

      # We action the login request using the parameters before we begin.
      # The login requests will match these to the user we just created in the factory, and authenticate us.
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button "Log in"
  end
end
