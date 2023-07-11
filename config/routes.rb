require_relative '../router'

Router.draw do
  get('/') { "Akshay's Blog" }
  
  get 'articles/index'
end