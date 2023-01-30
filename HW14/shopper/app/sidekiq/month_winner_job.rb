require 'sidekiq-scheduler'

class MonthWinnerJob
  include Sidekiq::Job

  def perform(*_args)
    puts 'Hello world'
  end
end
