require_relative './router.rb'

class App
  attr_reader :router

  def initialize
    @router = Router.new

    # shows the home page
    router.get('/') { "Akshay's Blog" }
    
    # shows all articles
    router.get('/articles') { 'All Articles' }
    
    # shows a single article
    router.get('/articles/1') { "First Article" }
  end

  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    response_html = router.response_body(env['REQUEST_PATH'])
    
    [200, headers, [response_html]]
  end
end
