class User < ApplicationRecord
  has_many :posts # user can have many posts
  has_many :comments, through: :post # User can have 0 or more comments in one
  has_many :likes, through: :post
  validates :name, presence: true, length: { in: 3..32 }
  validates :PostsCounter, presence: true, comparison: { greater_than_or_equal_to: 0 },
                           numericality: { only_integer: true }
  def first_three_posts
    posts.includes(:user).order(created_at: :DESC).limit(3)
  end
end
