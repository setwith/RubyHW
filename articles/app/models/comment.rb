class Comment < ApplicationRecord
  belongs_to :article

  enum :status, { unpublished: 0, published: 1 }
end
