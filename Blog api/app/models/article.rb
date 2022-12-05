class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :body, presence: true

  def all_tags
    tags.map(&:name).join(',')
  end
end
