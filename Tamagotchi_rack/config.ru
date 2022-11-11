require './app/application'

use Rack::Reloader, 0
run Application.new
