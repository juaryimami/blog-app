class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<count> characters is the maximum allowed' }
  validates :comment_counter, numericality: { only_integer: true,
                                              greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true,
                                           greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    post_counter = user.posts.count
    user.update(post_counter: post_counter)
  end
end
