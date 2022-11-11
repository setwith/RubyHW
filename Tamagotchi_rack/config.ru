require './app/application'

use Rack::Auth::Basic do |username, password|
  [username, password] == %w[user goodpassword]
end
use Rack::Reloader, 0
run Application.new
