require 'erb'
require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    @title = 'All Articles'
    render :index
  end

  def render(view)
    bind = binding
    view_variables.each do |var|
      bind.local_variable_set(var[1..-1].to_sym, self.instance_variable_get(var))
    end

    controller_name = self.class.name.downcase.split('controller').first  # articles
    view_file = "views/#{controller_name}/#{view.to_s}.html.erb"  # views/articles/index.html.erb
    template = ERB.new File.read(view_file)
    template.result(bind)
  end

  def view_variables
    self.instance_variables - [:@env]
  end
end