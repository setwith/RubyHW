class ApplicationController < ActionController::Base
  before_action :set_querry
  helper_method :current_cart

  def set_querry
    @querry = Product.ransack(params[:q])
  end

  def current_cart
    Cart.find(cookies[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    cookies[:cart_id] = cart.id
    cart
  end
end
