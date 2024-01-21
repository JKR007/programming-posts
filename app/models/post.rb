class Post < ApplicationRecord
  has_rich_text :content

  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  validates :title, presence: true

  scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }

  def published?
    published_at?
  end
end
