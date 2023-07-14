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
      if path.include? '/'                                            # 'articles/index'
        controller_name, action_name = path.split('/')                          # 'articles', 'index'
        
        @routes[path.prepend('/')] = ->(env) {
          controller_klass_name = controller_name.capitalize + 'Controller'  # 'ArticlesController'
          controller_klass = Object.const_get(controller_klass_name)    # ArticlesController
          kontroller = controller_klass.new(env)                      # controller = ArticlesController.new(env)
          kontroller.send(action_name.to_sym)                              # controller.index
          kontroller.render("views/#{controller_name}/#{action_name}.html.erb") # controller.render('views/..')
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