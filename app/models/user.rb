class User < ApplicationRecord
  has_one :post
  has_many :comments: :post
end
