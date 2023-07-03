require 'erb'
require_relative './config/routes'

class App
  def call(env)
    response_html = router.build_response(env)

    [200, headers, [response_html]]
  end

  private
    def router
      Router.instance
    end

    def headers
      { 'Content-Type' => 'text/html' }
    end
end