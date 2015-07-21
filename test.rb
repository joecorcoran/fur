require 'treetop'
require 'pp'
require_relative './nodes'
require_relative './compiler'

Treetop.load 'flua'
parser = FluaParser.new

input = <<-FLUA
  (
    (fn my-add-1 (x y) (add x y))
    (my-add-1 1 2)
  )
FLUA

program = parser.parse(input)
ast = program.call
pp Flua::Compiler.call(ast)
