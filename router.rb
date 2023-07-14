require 'singleton'

require_relative 'controllers/articles_controller'

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
      if path.include? '/'  # 'articles/index'
        controller, action = path.split('/')  # 'articles', 'index'
        controller_klass_name = controller.capitalize + 'Controller'  # 'ArticlesController'
        controller_klass = Object.const_get(controller_klass_name)  # ArticlesController
        @routes[path.prepend('/')] = ->(env) {
          kontroller = controller_klass.new(env)                      # controller = ArticlesController.new(env)
          kontroller.send(action.to_sym)                              # controller.index
          kontroller.render("views/#{controller}/#{action}.html.erb") # controller.render('views/..')
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end
end