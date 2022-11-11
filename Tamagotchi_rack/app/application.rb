# frozen_string_literal: true

class Application
  def call(env)
    request = Rack::Request.new(env)
    case request.path
    when '/' then Rack::Response.new(render('index.html.erb')).finish
    else Rack::Response.new('Not Found', 404).finish
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end
