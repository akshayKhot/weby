class Router
  def initialize
    @routes = {}
  end

  def get(path, &blk)
    @routes[path] = blk
  end

  def build_response(path)
    handler = @routes[path] || ->{ 'no route found' } 
    handler.call 
  end
end