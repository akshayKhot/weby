require 'erb'
require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    @title = 'All Articles'
    @name = 'Akshay'
  end

  def render(view_template)
    erb_template = ERB.new File.read(view_template)
    erb_template.result(get_binding)
  end

  def get_binding
    binding
  end
end