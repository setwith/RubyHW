class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :author

  enum status: { unpublished: 0, published: 1 }
end
