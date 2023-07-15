require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    @title = 'All Articles'
  end
end