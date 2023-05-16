class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_like_counter

  def update_likes_counter
    post.update(like_counter: post.likes.count)
  end
end
