require 'treetop'
require_relative './ast'
require_relative './runtime'

module Fur
  def self.parser
    @parser ||= begin
      Treetop.load 'fur'
      FurParser.new
    end
  end

  def self.eval(input)
    tree = parser.parse(input)
    program = tree.call
    Fur::Runtime.call(program)
  end
end
