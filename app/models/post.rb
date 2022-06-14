class Post < ApplicationRecord
  belongs_to :user
  has_many :comments # Post can have 0 or more comments
  has_many :likes # Posts can have 0 or more likes
  has_many :users, through: :likes # Posts can have 0 or more likes from users
  has_many :users, through: :comments # A posts has 0 or more users commenting on it

  def posts_counter
    user.update(PostsCounter: user.posts.count)
  end

  def recent_comments
    comments.includes(:post).order(created_at: :DESC).limit(5)
  end
end
