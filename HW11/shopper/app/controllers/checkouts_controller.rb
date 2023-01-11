class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user
                        .payment_processor
                        .checkout(
                          mode: 'payment',
                          line_items: 'price_1MOxXgHALZtoIW7LE0Ors13e'
                          seccess_url: checkout_seccess_url
                        )
  end

  def success; end
end
