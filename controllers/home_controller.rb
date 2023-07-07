require 'erb'

class HomeController
  def index(env)
    title = "Rack on Rails"
    template = ERB.new File.read('views/index.html.erb')
    template.result(binding)
  end
end