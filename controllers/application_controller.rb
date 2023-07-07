require 'debug'

class ApplicationController
  def render(view, data)
    controller_name = self.class.name.downcase.split('controller').first
    view_file = "views/#{controller_name}/#{view.to_s}.html.erb"
    template = ERB.new File.read(view_file)
    template.result(binding)
  end
end