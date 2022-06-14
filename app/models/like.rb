class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_likes
    post.update(LikesCounter: post.likes.count)
  end
end
