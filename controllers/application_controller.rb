class ApplicationController
  def render(view, data)
    template = ERB.new File.read(view)
    template.result(binding)
  end
end