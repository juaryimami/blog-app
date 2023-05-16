class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comment_counter

  def update_comments_counter
    post.update(comment_counter: post.comments.count)
  end
end
