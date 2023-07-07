require 'singleton'
require_relative './controllers/home_controller'

class Router
  include Singleton

  attr_reader :routes

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
      if path.include? '/'  # 'home/index'
        controller, action = path.split('/')  # 'home', 'index'
        controller_klass_name = controller.capitalize + 'Controller'  # 'HomeController'
        controller_klass = Object.const_get(controller_klass_name)  # HomeController
        handler = controller_klass.new.method(action.to_sym)  # index
        @routes[path.prepend('/')] = handler.to_proc  # { '/home/index' => Proc(index) }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end
end