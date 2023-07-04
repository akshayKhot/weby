require_relative '../router'

Router.draw do
  get('/') { "Akshay's Blog" }
  
  get('/articles') { 'All Articles' }
  
  get('/articles/1') do |env| 
    puts "Path: #{env['REQUEST_PATH']}"
    "First Article"
  end

  get 'application#index'
end