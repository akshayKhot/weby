require 'debug'
require 'erb'
require_relative './config/routes'

class App
  def call(env)
    response_html = router.build_response(env)
    
    [200, headers, [response_html]]
  end

  def foo(env)
    'Foo'
  end

  private
    def router
      Router.instance
    end

    def build_response(env)
      title = get_title(env)
      template = ERB.new(template_html)
      template.result(binding)
    end

    def get_title(env)
      query = env['QUERY_STRING'] # "title=ruby"
      values = query.split('=')   # ["title", "ruby"]
      values[1] || 'Hello World'  # ruby
    end

    def template_html
      File.read 'views/index.html.erb'
    end

    def headers
      { 'Content-Type' => 'text/html' }
    end
end