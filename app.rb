require_relative './router.rb'

class App
  attr_reader :router

  def initialize
    @router = Router.new

    router.get('/') { 'Hello, World!' }
    router.get('/post') { 'New Post' }
  end

  def call(env)
    response_html = router.response_body(env)
    [200, headers, [response_html]]
  end

  private
    def headers
      { 'Content-Type' => 'text/html' }
    end
end
