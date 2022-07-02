require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(name: 'Bonke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Big dreams',
                     PostsCounter: 0)
  post = Post.new(user_id:user.id, Title: 'Bornfire', Text: 'My name is Earl', CommentsCounter: 0, LikesCounter: 0)

  subject { Comment.new(post_id:post.id, user:user, Text: 'My test comment') }
  before { subject.save }

  it 'Test if the Test is never nil' do
    test_case = subject
    test_case.Text = nil
    expect(test_case.valid?).to eq(false)
  end
end
