class ApplicationController < ActionController::Base
  before_action :set_query
  helper_method :current_cart

  def set_query
    @query = Product.ransack(params[:q])
  end

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end
end
