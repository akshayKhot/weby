require 'erb'
require_relative 'application_controller'

class HomeController < ApplicationController
  def index
    render :index, title: 'Rack on Rails'
  end

  def show
    render :show, name: 'Akshay'
  end
end