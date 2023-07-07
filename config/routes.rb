require_relative '../router'

Router.draw do
  get('/') { "Akshay's Blog" }
  
  get('/articles') { 'All Articles' }

  get 'home/index'
  get 'home/show'
end