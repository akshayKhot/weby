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
      if path.include? '/'                                # 'articles/index'
        @routes['/' + path] = ->(env) {
          controller_name, action_name = path.split('/')  # 'articles', 'index'
          controller_klass = constantize(controller_name) # ArticlesController
          kontroller = controller_klass.new(env)          # controller = ArticlesController.new(env)

          kontroller.send(action_name.to_sym)             # controller.index
          kontroller.render("views/#{controller_name}/#{action_name}.html.erb")
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env)
  end

  # input: 'articles'
  # output: ArticlesController
  def constantize(name)
    controller_klass_name = name.capitalize + 'Controller'  # 'ArticlesController'
    Object.const_get(controller_klass_name)
  end
end