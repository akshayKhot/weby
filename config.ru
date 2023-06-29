require 'rack'
require_relative './app'

use Rack::Reloader, 0 # <- Add this line
run App.new