require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.new(name: 'Saied', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'developer',
                  email: 'saied@gmail.com', password: '123456')
  post = Post.new(user: user, Title: 'title', Text: 'text')
  subject { Like.new(user: user, post:) }
  before { subject }

  it 'author is nil' do
    test_case = subject
    test_case.user = nil
    expect(test_case).to_not be_valid
  end

  it 'post is nil' do
    test_case = subject
    test_case.post = nil
    expect(test_case).to_not be_valid
  end
end