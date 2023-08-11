
class ArticlesController < ApplicationController
  def index
    @title = 'All Articles'
    @article = Article.new 'Ruby no Rails', 'Let\'s build a web application in Ruby, without Rails!'
  end
end