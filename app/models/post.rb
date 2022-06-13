class Post < ApplicationRecord
  belongs_to :user
  has_many :comments #Post can have 0 or more comments
  has_many :users :comments #A posts has 0 or more users commenting on it
end
