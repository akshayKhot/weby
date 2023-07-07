require 'erb'
require_relative 'application_controller'

class HomeController < ApplicationController
  def index(env)
    render 'views/index.html.erb', title: 'Rack on Rails'
  end
end