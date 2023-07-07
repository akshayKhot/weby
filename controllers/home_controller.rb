require 'erb'
require_relative 'application_controller'

class HomeController < ApplicationController
  def index(env)
    render :index, title: 'Rack on Rails'
  end

  def show(env)
    render :show, name: 'Akshay'
  end
end