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

  describe "Testing the interactions of users with log in page" do
    before :each do
      user = User.new(name: 'Bonke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                      Bio: 'full-snack', email: 'bonkegcobo291195@gmail.com', password: '123456')
      user.confirm
      user.save
    end

    it "When I click the submit button without filling in the username and the password, I get a detailed error." do
      visit new_user_session_path
      fill_in 'Email', with: nil
      fill_in 'Password', with: nil
      click_button "Log in"
      expect(page).to have_content("Invalid Email or password.")
    end

    it "When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error." do
      visit new_user_session_path
      fill_in 'Email', with: "123@mymail.com"
      fill_in 'Password', with: "abcdef"
      click_button "Log in"
      expect(page).to have_content("Invalid Email or password.")
    end

    it "When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page." do
      visit new_user_session_path
      fill_in "Email", with: 'bonkegcobo291195@gmail.com'
      fill_in "Password", with: '123456'
      click_button "Log in"
      expect(page).to have_current_path(root_path)
    end
  end
end
