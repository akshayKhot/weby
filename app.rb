require 'debug'
require_relative 'config/routes'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    response_html = router.build_response(env)
    
    [200, headers, [response_html]]
  end

  private
    def router
      Router.instance
    end
end
