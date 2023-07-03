require_relative './router'

Router.draw do
  get('/') { "Akshay's Blog" }
  
  get('/articles') { 'All Articles' }
  
  get('/articles/1') { "First Article" }
end