require 'rails_helper'

RSpec.describe 'Testing user index page', type: :feature do
  before(:each) do
    @first = User.create(name: 'bonke', photo: 'avatar.png',
                         Bio: 'Developer.',
                         email: 'bonke@email.com',
                         password: 'password', confirmed_at: Time.now,
                         PostsCounter: 0)

    @second = User.create(name: 'Madix', photo: 'avatar.png',
                          Bio: 'Developer.', email: 'msgeme@email.com',
                          password: 'password', confirmed_at: Time.now,
                          PostsCounter: 0)

    @third = User.create(name: 'Djc', photo: 'avatar.png',
                         Bio: 'Developer.', email: 'dream@email.com',
                         password: 'password', confirmed_at: Time.now,
                         PostsCounter: 0)

    visit user_session_path

    within 'form' do
      fill_in 'Email', with: @first.email
      fill_in 'Password', with: @first.password
    end

    click_button 'Log in'
  end

  feature 'User Index' do
    background { visit root_path }
    scenario 'See all usernames' do
      expect(page).to have_content('bonke')
      expect(page).to have_content('Madix')
      expect(page).to have_content('Djc')
    end
  end

  scenario 'See profile picture for each user' do
    expect(page.first('img')['src']).to have_content 'avatar'
  end

  scenario 'See the number of posts each user has written' do
    expect(page).to have_content('Number of posts: 0')
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    click_link 'bonke', match: :first
    expect(current_path).to eq user_path(User.first.id)
  end
end
