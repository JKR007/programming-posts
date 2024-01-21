class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :followed_users, foreign_key: :follower_id, class_name: 'UserRelationship'
  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :following_users, foreign_key: :followee_id, class_name: 'UserRelationship'
  has_many :followers, through: :following_users, dependent: :destroy

  has_many :posts

  validates :first_name, :last_name, :email, presence: true

  scope :all_except, ->(user) { where.not(id: user) }

  # Follows a user
  def follow(followee_id)
    followed_users.create(followee_id: followee_id)
  end

  # Unfollows a user
  def unfollow(followee_id)
    followed_users.find_by(followee_id: followee_id).destroy
  end

  # Returns true if current user follows followee
  def following?(followee)
    followees.include?(followee)
  end
end
