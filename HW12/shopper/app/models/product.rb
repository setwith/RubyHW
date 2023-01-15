# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  price       :decimal(10, 2)
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :product_categories, allow_destroy: true
end
