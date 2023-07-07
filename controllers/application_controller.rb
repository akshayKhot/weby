require 'debug'

class ApplicationController
  attr_reader :env
  
  def initialize(env)
    @env = env
  end

  def render(view, data)
    controller_name = self.class.name.downcase.split('controller').first
    view_file = "views/#{controller_name}/#{view.to_s}.html.erb"
    template = ERB.new File.read(view_file)
    template.result(binding)
  end
end