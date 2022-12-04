class Author < ApplicationRecord
  has_many :articles
  has_many :comments

  # validates :author, presence: true
end
