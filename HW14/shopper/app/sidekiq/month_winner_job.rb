require 'sidekiq-scheduler'

class MonthWinnerJob
  include Sidekiq::Job

  def perform(*_args)
    MonthWinnerService.new(winners: 'MonthWinner').call
  end
end
