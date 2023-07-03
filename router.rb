class Router
  def initialize
    @routes = {}
  end

  def get(path, &blk)
    @routes[path] = blk
  end

  def response_body(path)
    handler = @routes[path] || ->{ 'no route found' } 
    handler.call 
  end
end