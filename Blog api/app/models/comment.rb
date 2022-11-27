class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  validates :body, :author_id, :article_id, presence: true

  enum status: { unpublished: 0, published: 1 }

  scope :unpublished, -> { where(status: unpublished) }
  scope :published, -> { where(status: published) }
end
