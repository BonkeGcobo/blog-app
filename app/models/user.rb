class User < ApplicationRecord
  has_many :posts #user can have many posts
  has_many :comments: :post #User can have 0 or more comments in one post
end
