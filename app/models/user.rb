class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy, foreign_key: 'author_id'
  has_many :comments, dependent: :destroy, foreign_key: 'author_id'
  has_many :likes, dependent: :destroy, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true,
                                           greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def as_json(_options = {})
    super(only: %i[id name bio post_counter])
  end
end
