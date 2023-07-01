require 'erb'

name = 'Akshay'
age = 30

template = ERB.new 'My name is <%= name %> and I am <%= age %> years old'
puts template.result(binding)