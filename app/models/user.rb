class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  validates :name, presence: true, length: { in: 2..25 }
  validates :posts_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    Post.where(author: self).order(created_at: :desc).limit(3)
  end
end
