class ApplicationController
  attr_reader :env
  
  def initialize(env)
    @env = env
  end

  def render(view_template)
    erb_template = ERB.new File.read(view_template)
    erb_template.result(get_binding)
  end

  def get_binding
    binding
  end
end