class Request
  attr_reader :env

  def initialize(env)
    @env = env  
  end

  def method
    env['REQUEST_METHOD']
  end

  def path
    env['REQUEST_PATH']
  end

  def uri
    env['REQUEST_URI']
  end
end