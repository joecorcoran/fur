require_relative './fur'

input = <<-ff
  id a { a }
  id "hello"!
ff

puts Fur.eval(input)
