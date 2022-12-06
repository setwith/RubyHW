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

  def all_tags=(_names)
    self.name = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
