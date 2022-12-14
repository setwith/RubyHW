class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, :author_id, :article_id, presence: true

  enum :status, %i[unpublished published]

  scope :unpublished, -> { where(status: :unpublished) }
  scope :published, -> { where(status: :published) }

  scope :latest, -> { last(10) }
  scope :order_comments, -> { order(created_at: :desc) }
end
