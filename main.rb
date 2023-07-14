require 'erb'

class Person
  def initialize
    @name = 'Akshay'
    @age = 30
  end

  def get_binding
    binding
  end
end

ak = Person.new

erb = ERB.new 'My name is <%= @name %> and I am <%= @age %> years old'
puts erb.result(ak.get_binding)
