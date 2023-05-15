class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :post_counter, numericality: { only_integer: true, greatr_than_or_equal_to: 0 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
