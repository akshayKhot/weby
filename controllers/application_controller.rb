class ApplicationController
  def render(view, data)
    view_file = "views/#{view.to_s}.html.erb"
    template = ERB.new File.read(view_file)
    template.result(binding)
  end
end