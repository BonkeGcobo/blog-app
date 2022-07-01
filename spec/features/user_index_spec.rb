require 'rails_helper'

RSpec.describe 'Testing the user index page', type: :feature do
  before :each do
    user = User.new(name: 'Bonke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
           Bio: 'full-snack', email: 'bonkegcobo291195@gmail.com', password: '123456')
    user.confirm
    user.save


    user_1 = User.new(name: 'Khanya', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'full-snack', email: '12345@gmail.com', password: 'abcdef1')
    user_1.confirm
    user_1.save
    
    user_2 = User.new(name: 'Live', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'full-snack', email: 'codeislife@ymail.com', password: 'bsiicy')
    user_2.confirm
    user_2.save       
  end
  
  describe "Test if can see username for all users" do
    it "Test if can see the username of first user" do
      visit new_user_session_path
      fill_in "Email", with: "bonkegcobo291195@gmail.com"
      fill_in "Password", with: "123456"
      click_button "Log in"
      expect(page).to have_content('Bonke')
    end

    it "Test if can see the username user_1" do
      visit new_user_session_path
      fill_in "Email", with: "12345@gmail.com"
      fill_in "Password", with: "abcdef1"
      click_button "Log in"
      expect(page).to have_content('Khanya')
    end

    it "Test if can see the username user_1" do
      visit new_user_session_path
      fill_in "Email", with: "codeislife@ymail.com"
      fill_in "Password", with: "bsiicy"
      click_button "Log in"
      expect(page).to have_content('Live')
    end
  end
end