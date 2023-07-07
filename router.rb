require 'singleton'
require_relative './controllers/home_controller'

class Router
  include Singleton

  attr_reader :routes

  PATTERN = /\/?([a-z]+)\/([a-z]+)/

  class << self
    def draw(&blk)
      Router.instance.instance_exec(&blk)
    end
  end

  def initialize
    @routes = {}
  end

  def get(path, &blk)
    if blk
      @routes[path] = blk
    else
      if PATTERN.match?(path)  # 'home/index'
        @routes[path] = ->(env) {
          md = PATTERN.match path
          controller, action = md[1], md[2]  # 'home', 'index'
          controller_klass_name = controller.capitalize + 'Controller'  # 'HomeController'
          controller_klass = Object.const_get(controller_klass_name)  # HomeController
          response = controller_klass.new(env).send(action.to_sym)   # call HomeController#index
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH'].start_with?('/') ? env['REQUEST_PATH'].sub('/', '') : env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end
end