require 'rack'
require_relative 'app'

# Reload source after change
use Rack::Reloader, 0

# Serve all requests beginning with /public 
# from the "public" folder and favicon.ico
# from the current directory
use Rack::Static, urls: ['/public', "/favicon.ico"]

run App.new