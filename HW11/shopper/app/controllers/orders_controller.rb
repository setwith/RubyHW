class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[show update_status]

  def create
    order = current_user.orders.create(cart: current_cart)

    redirect_to order_path(order), notice: 'Order was created successfully'
  end

  def show; end

  def update_status
    @order.update(status: :paid)
    cookies.delete(:cart_id)

    redirect_to order_path(@order), notice: 'Order was paid successfully'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end
end
