class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify

  def add_product(product)
    line_items.create!(product:, quantity: 1)
  end

  def total_price
    line_items.map(&:product).sum(&:price)
  end
end
