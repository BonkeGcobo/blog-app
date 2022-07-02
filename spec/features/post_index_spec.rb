require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.create(name: 'Nicholas', Bio: 'Developer', PostsCounter: 0, confirmed_at: Time.now,
                          email: 'zed@mail.com', password: 'test123')
      @post = Post.create(user: @user, Title: 'Tests', Text: 'testing', LikesCounter: 7,
                          CommentsCounter: 5)
    end
    before { @post.save }
    it 'if there is max 250 characters' do
      @post.Title = 'Testing'
      expect(@post).to be_valid
    end
    it 'if likes counter is integer' do
      @post.LikesCounter = 5
      expect(@post).to be_valid
    end
    it 'if likes counter greater than or equal to zero' do
      @post.LikesCounter = -9
      expect(@post).to_not be_valid
    end
    it 'if comments counter greater than or equal to zero.' do
      @post.CommentsCounter = -5
      expect(@post).to_not be_valid
    end
    it 'if comments counter is integer' do
      @post.CommentsCounter = 8
      expect(@post).to be_valid
    end
  end
end

RSpec.describe 'Posts show page', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'Nic', photo: 'avatar.png',
                        Bio: 'Developer from Kenya',
                        email: 'nicbke@mail.com', password: 'password',
                        confirmed_at: Time.now, PostsCounter: 0)

    Post.create(Title: 'My title', Text: 'My text',
                user_id: @user.id, LikesCounter: 0, CommentsCounter: 0)
    @comment = Comment.create(Text: 'My first comment', user: User.first, post: Post.first)
    @comment = Comment.create(Text: 'My second comment', user: User.first, post: Post.first)
    @like = Like.create(user_id: User.first.id, post_id: Post.first.id)
    visit new_user_session_path
    fill_in 'Email', with: 'nicbke@mail.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit "/users/#{User.first.id}/posts"
  end
  describe 'View posts' do
    scenario 'I can see the posts title.' do
      expect(page).to have_content 'My title'
    end
    scenario 'I can see who wrote the post' do
      expect(page).to have_content 'Nic'
    end
    scenario 'I can see the post text.' do
      expect(page).to have_content 'My text'
    end

    scenario 'I can see the post comments.' do
      expect(page).to have_content 'My first comment'
      expect(page).to have_content 'My second comment'
    end

    scenario 'I can see the user\'s profile picture.' do
      expect(page).to have_css('img[src*="avatar"]')
    end

    scenario 'I can see the user\'s username.' do
      expect(page).to have_content 'Nic'
    end

    scenario "When I click on a post, I am redirected to that post's show page" do
      click_link 'My title'
      expect(current_path).to eq "/users/#{User.first.id}/posts/#{Post.first.id}"
    end
  end
end
