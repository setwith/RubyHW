class MonthWinnerService
  attr_reader :winners

  def initialize(winners)
    @winners = winners
  end

  def call
    users = month_order.map(&:user).uniq.sample(2)

    users.each do |user|
      OrderMailer.winner(user).delivery_later
    end
  end

  private

  def month_order
    start_date = DateTime.now - 1.month
    Order.where(created_at: start_date..DateTime.now, status: 'paid')
  end
end
