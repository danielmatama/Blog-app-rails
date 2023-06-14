class Comment < ApplicationRecord
  after_create :update_comment_counter
  belongs_to :author, class_name: 'User'
  belongs_to :post

  private

  def update_comment_counter
    post_id = post.id
    Post.increment_counter(:comments_counter, post_id)
  end
end
