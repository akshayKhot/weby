class ArticlesController
  attr_reader :env
  
  def initialize(env)
    @env = env
  end
  
  def index
    'All Articles'
  end
end