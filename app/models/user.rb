class User < ApplicationRecord
  has_many :posts # user can have many posts
  has_many :comments, through: :post # User can have 0 or more comments in one
  has_many :likes, through: :post

  def first_three_posts
    posts.includes(:user).order(created_at: :DESC).limit(3)
  end
end
