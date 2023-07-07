require 'singleton'
require_relative '../controllers/application_controller'

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
      if path.include? '#'  # 'application#index'
        controller, action = path.split('#')  # 'application', 'index'
        controller_klass_name = controller.capitalize + 'Controller'  # 'ApplicationController'
        controller_klass = Object.const_get(controller_klass_name)  # ApplicationController
        handler = controller_klass.new.method(action.to_sym)  # index
        @routes[path.gsub('#', '/').prepend('/')] = handler.to_proc  #{ '/application/index' => Proc(index) }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end
end