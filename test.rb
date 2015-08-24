require_relative './fur'

input = <<-fur
  double x { multiply x 2! }
  double 5!
fur

puts Fur.call(input)
