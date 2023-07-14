require 'erb'
require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    @title = 'All Articles'
    @name = 'Akshay'
    render :index
  end

  def render(view)
    controller_name = self.class.name.downcase.split('controller').first  # articles
    view_file = "views/#{controller_name}/#{view.to_s}.html.erb"  # views/articles/index.html.erb
    template = ERB.new File.read(view_file)
    template.result(get_binding)
  end

  def get_binding
    binding
  end
end