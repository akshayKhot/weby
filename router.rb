class Router
  attr_reader :routes

  def initialize
    @routes = Hash.new
  end

  def get(path, &blk)
    @routes[path] = blk
  end
  
  def build_response(env)
    path = env['REQUEST_URI']
    routes.fetch(path).call
  end
end