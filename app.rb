require 'debug'
require 'erb'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }
    
    title = get_title(env) # new code here
    template = ERB.new(template_html)
    response_html = template.result(binding)

    [200, headers, [response_html]]
  end

  def get_title(env)
    query = env['QUERY_STRING'] # "title=ruby"
    values = query.split('=')   # ["title", "ruby"]
    values[1] || 'Hello World'  # ruby
  end

  def template_html
    File.read 'views/index.html.erb'
  end
end