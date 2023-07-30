require 'debug'
require 'logger'
require_relative 'config/routes'

class App
  attr_reader :logger

  def initialize
    @logger = Logger.new('log/development.log')
  end

  def call(env)
    logger.info "#{env['REQUEST_METHOD']}: #{env['REQUEST_PATH']}"

    headers = { 'Content-Type' => 'text/html' }

    response_html = router.build_response(env)

    [200, headers, [response_html]]
  rescue => e
    logger.error("Oops, something went wrong. Error: #{e.message}")
    [200, headers, ["Error: #{e.message}"]]
  end

  private
    def router
      Router.instance
    end
end
