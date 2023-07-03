require_relative './router'

Router.draw do
  get('/') { 'Hello World' }

  get('/a') do |env| 
    'Page A' + env['REQUEST_URI']
  end

  get('/b') { |env| 'Page B' }

  get('/c') { 'This works!!' }
end