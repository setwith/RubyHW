class Author < ApplicationRecord
  has_many :articles
  has_many :comments
  has_many :likes

  # validates :author, presence: true
end
