require 'rails_helper'

RSpec.describe Like, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  user = User.create(name: 'Bonke', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Big dreams', PostsCounter: 0)
  post=Post.create(user:, Title: 'Bornfire', Text: 'My name is Earl', CommentsCounter: 0, LikesCounter: 0)

  subject {Like.create(post:post, user:user)}
  

  it "Test if the Likes counter gets updated" do
    test_case = subject
    test_case.update_likes
    expect(post.LikesCounter).to eq(1)
  end
end
