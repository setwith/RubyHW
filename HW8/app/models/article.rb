class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :likes, as: :likeable, dependent: :destroy

  accepts_nested_attributes_for :tags

  validates :title, presence: true
  validates :body, presence: true

  enum status: { unpublished: 0, published: 1 }

  scope :unpublished, -> { where(status: 0) }
  scope :published, -> { where(status: 1) }

  scope :filter_by_status, ->(status) { where status: }

  # def all_tags
  #   tags.map(&:name).join(',')
  # end

  # def all_tags=(_names)
  #   self.name = names.split(',').map do |name|
  #     Tag.where(name: name.strip).first_or_create!
  #   end
  # end
end
