class Category < ApplicationRecord
  validates :title, uniqueness: true

  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
end
