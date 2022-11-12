require 'erb'
require_relative 'pet'

class Application
  attr_reader :request, :path

  # attr_accessor :pet

  def call(env)
    @request = Rack::Request.new(env)
    @path = request.path

    response.finish
  end

  def response
    case path
    when '/'
      rack_response('index.html.erb')
    when '/create_pet'
      name = request.params['name']
      return rack_response_redirect if name.nil? || name.length.zero?

      @pet = Pet.new(name)
      rack_response_redirect('/game')
    when '/game'
      return rack_response_redirect if @pet.nil?

      rack_response('main.html.erb')
    when '/feed'
      return rack_response_redirect if @pet.nil?

      @pet.feed
      rack_response('game.html.erb')

    when '/walk'
      return rack_response_redirect if @pet.nil?

      @pet.walk
      rack_response('game.html.erb')

    when '/put_to_bed'
      return rack_response_redirect if @pet.nil?

      @pet.put_to_bed
      rack_response('game.html.erb')

    when '/toss'
      return rack_response_redirect if @pet.nil?

      @pet.toss
      rack_response('game.html.erb')

    when '/gym'
      return rack_response_redirect if @pet.nil?

      @pet.gym
      rack_response('game.html.erb')

    when '/talk'
      return rack_response_redirect if @pet.nil?

      @pet.talk
      rack_response('game.html.erb')

    when '/hug'
      return rack_response_redirect if @pet.nil?

      @pet.hug
      rack_response('game.html.erb')

    when '/wash'
      return rack_response_redirect if @pet.nil?

      @pet.wash
      rack_response('game.html.erb')

    when '/treat'
      return rack_response_redirect if @pet.nil?

      @pet.treat
      rack_response('game.html.erb')

    when '/watch'
      return rack_response_redirect if @pet.nil?

      @pet.watch
      rack_response('game.html.erb')
    end
  end

  def rack_response(filename)
    Rack::Response.new(render(filename))
  end

  def render(filename)
    path_to_view = File.expand_path("../views/#{filename}", __FILE__)
    ERB.new(File.read(path_to_view)).result(binding)
  end

  def rack_response_redirect(new_path = '/')
    Rack::Response.new do |response|
      response.redirect(new_path)
    end
  end
end
