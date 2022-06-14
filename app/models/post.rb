class Post < ApplicationRecord
  belongs_to :user
  has_many :comments # Post can have 0 or more comments
  has_many :likes # Posts can have 0 or more likes
  
  def posts_counter
    user.update(PostsCounter: user.posts.count)
  end

  def recent_comments
    comments.includes(:post).order(created_at: :DESC).limit(5)
  end
end
