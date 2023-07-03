require_relative './config/routes'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    response_html = router.build_response(env['REQUEST_PATH'])
    
    [200, headers, [response_html]]
  end

  private
    def router
      Router.instance
    end
end
