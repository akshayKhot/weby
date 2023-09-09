require 'debug'
require 'zeitwerk'

require_relative 'config/routes'

class App
  def initialize
    loader = Zeitwerk::Loader.new
    loader.push_dir('models')
    loader.push_dir('controllers')
    loader.setup
  end

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
