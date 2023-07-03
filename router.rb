require_relative './request.rb'

class Router
  attr_reader :routes

  def initialize
    @routes = {}
  end

  def get(path, &blk)
    routes[path] = blk
  end

  def response_body(env)
    request = Request.new env
    clojure = routes[request.path] || ->{ 'no route found' } 
    clojure.call 
  end
end