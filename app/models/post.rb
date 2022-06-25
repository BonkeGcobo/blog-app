class Post < ApplicationRecord
  belongs_to :user
  has_many :comments # Post can have 0 or more comments
  has_many :likes # Posts can have 0 or more likes
  validates :Title, presence: true, length: { in: 3..250 }
  validates :CommentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def posts_counter
    user.update(PostsCounter: user.posts.count)
  end

  def recent_comments
    comments.includes(:post).order(created_at: :DESC).limit(5)
  end

  def all_comments
    comments.includes(:post).order(created_at: :DESC)
  end
end
