class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_one :order

  def add_product(product)
    line_items.create!(product:, quantity: 1)
  end

  def total_price
    line_items.to_a.sum { |line_item| line_item.total }
  end
end
