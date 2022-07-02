require 'rails_helper'

RSpec.feature 'Testing user show page', type: :feature do
  before(:each) do
    User.destroy_all
    @first = User.new(name: 'Banstein', photo: 'pic.png',
                      Bio: 'Developer', email: 'banstein@gmail.com', password: '1234abcd')
    @first.confirm
    @first.save

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  background { visit user_path(User.first.id) }

  scenario "I can see the user's username" do
    expect(page).to have_content('Banstein')
  end

  scenario "I can see the user's profile picture" do
    expect(page).to have_css('.image')
  end

  scenario "I can see the user's bio" do
    expect(page).to have_content('Developer')
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    click_link('See all posts')
    expect(current_path).to eq user_posts_path(User.first.id)
  end
end
