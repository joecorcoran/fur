require 'treetop'
require_relative './fur/ast'
require_relative './fur/parser'
require_relative './fur/runtime'
require_relative './fur/version'

module Fur
  def self.call(input)
    tree = parser.parse(input)
    program = tree.call
    Fur::Runtime.call(program)
  end

  private

  def self.parser
    @parser ||= GrammarParser.new
  end
end

def Fur(input)
  Fur.call(input)
end
