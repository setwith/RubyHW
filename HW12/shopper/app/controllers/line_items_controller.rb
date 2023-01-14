class LineItemsController < ApplicationController
  before_action :find_line_item, only: [:create]
  before_action :set_line_item, only: %i[destroy increase_quantity decrease_quantity]

  def create
    product = Product.find(params[:product_id])

    if @line_item
      @line_item.update(quantity: @line_item.quantity + 1)
    else
      @line_item = current_cart.add_product(product)

    end
    redirect_to cart_path, notice: "#{product.name} was successfully added to cart"
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path, notice: "#{@line_item.product.name} deleted from cart"
  end

  def increase_quantity
    @line_item.update(quantity: @line_item.quantity + 1)
    redirect_to cart_path
  end

  def decrease_quantity
    @line_item.update(quantity: @line_item.quantity - 1)
    redirect_to cart_path
  end

  private

  def find_line_item
    @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
