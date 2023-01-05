class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :line_items, dependent: :nullify

  accepts_nested_attributes_for :product_categories, allow_destroy: true
end
