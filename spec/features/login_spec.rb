require 'rails_helper'

RSpec.describe "Testing the login page", type: :feature do

  describe "Test if the contents in the login page are present" do
    it "Test if there is an email input field" do
      visit new_user_session_path
      expect(page).to have_selector('input[type=email]')
    end

    it "Test if there is a password field" do
      visit new_user_session_path
      expect(page).to have_selector('input[type=password]')
    end

    it "Test if the submit button exits" do
      visit new_user_session_path
      expect(page).to have_selector('input[type=submit]')
    end
  end
end
