class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :product_categories
  has_many :categories, through: :product_categories
end