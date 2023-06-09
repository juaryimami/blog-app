class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250,
                              too_long: '%<count> characters is the maximum allowed' }
  validates :comments_counter, numericality: { only_integer: true,
                                               greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    post_counter = author.posts.count
    author.update(post_counter: post_counter)
  end

  def all_comments
    comments.order(created_at: :desc)
  end
end
