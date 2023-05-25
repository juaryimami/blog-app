class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, optional: true

  after_save :update_likes_counter

  private

  def update_likes_counter
    like_counter = post.likes.count
    post.update(like_counter: like_counter)
  end
end
