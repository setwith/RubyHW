class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order_email.subject
  #
  def new_order_email
    @user = params[:user]
    @order = params[:order]

    @line_items = @order.cart.line_items

    mail(
      to: @user.email,
      subject: 'Order created successfully'
    )
  end
end
