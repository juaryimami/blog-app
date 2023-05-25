class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    comment_counter = post.comments.count
    post.update(comment_counter: comment_counter)
  end
end
