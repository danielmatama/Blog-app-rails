class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments
  has_many :likes
end

class Comment < ApplicationRecord
  belongs_to :post
end

class Like < ApplicationRecord
  belongs_to :post
end
