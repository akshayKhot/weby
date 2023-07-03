require 'singleton'

class Router
  include Singleton

  attr_reader :routes

  def initialize
    @routes = Hash.new
  end

  def get(path, &blk)
    @routes[path] = blk
  end
  
  def build_response(env)
    path = env['REQUEST_URI']
    blk = routes.fetch(path, nil)
    if blk
      blk.call env
    else
      "no route defined for path '#{path}'"
    end
  end
end