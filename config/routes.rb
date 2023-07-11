require_relative '../router'
require 'debug'

Router.draw do
  get('/') { "Akshay's Blog" }
  
  get 'articles/index'
end