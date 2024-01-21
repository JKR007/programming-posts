class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  validates :title, presence: true

  scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }

  after_commit :notify_author_followers, if: :persisted? && :published_at_changed?

  def published?
    published_at?
  end

  private

  def notify_author_followers
    NotifyFollowersAboutNewPostManager.new(author, self).proccess
  end

  def published_at_changed?
    published_at_previously_changed?
  end
end
