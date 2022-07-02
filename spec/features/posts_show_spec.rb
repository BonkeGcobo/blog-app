require 'rails_helper'

RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Nicholas', photo: 'profile.png', Bio: 'Developer',
                        email: 'nicbkee@email.com', password: 'password',
                        confirmed_at: Time.now, PostsCounter: 0)

    @user1 = User.create(name: 'Iknw', photo: 'profile.jpg',
                         Bio: 'Developer', email: 'msgeme@email.com',
                         password: 'password', confirmed_at: Time.now)

    Post.create(Title: 'My title', Text: 'My text',
                user_id: @user.id, LikesCounter: 0, CommentsCounter: 0)
    @comment = Comment.create(Text: 'My first comment',
                              user: User.first, post: Post.first)
    @comment = Comment.create(Text: 'My second comment',
                              user: User.first, post: Post.first)
    @like = Like.create(user_id: User.first.id,
                        post_id: Post.first.id)

    visit new_user_session_path
    fill_in 'Email', with: 'nicbkee@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/users/#{User.first.id}/posts/#{Post.first.id}"
  end

  describe 'Specs for view posts#show' do
    it 'Can see the posts title.' do
      expect(page).to have_content 'My title'
    end

    it 'Can see who wrote the post' do
      expect(page).to have_content 'Nicholas'
    end


    it 'Can see the username of each commentor' do
      expect(page).to have_content 'Nicholas'
    end

    it 'Can see the comment each commentor left' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end
  end
end