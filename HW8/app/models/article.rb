class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :likes, as: :likeable, dependent: :destroy

  accepts_nested_attributes_for :tags

  validates :title, presence: true
  validates :body, presence: true

  enum :status, %i[unpublished published], default: 'unpublished'

  scope :unpublished, -> { where(status: :unpublished) }
  scope :published, -> { where(status: :published) }

  scope :search, ->(querry) { where('title || body ILIKE ?', "%#{querry}%") }
  scope :filter_by_status, ->(status) { where status: }
  scope :filter_by_author, ->(name) { joins(:author).where('authors.name ILIKE ?', "%#{name}%") }
  scope :filter_by_tags, ->(tags) { joins(:tags).where('tags.name IN (?)', tags) }
end
