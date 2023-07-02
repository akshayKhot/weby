require 'debug'
require 'erb'

class App
  def call(env)
    response_html = build_response(env)

    [200, headers, [response_html]]
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