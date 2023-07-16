class Article
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end
end