require 'ffi'

%w{
  boolean
  errors
  exec
  function
  identifier
  integer
  libfur
  library
  list
  list/integer
  param
  scope
  string
  tree
}.each { |file| require_relative("./runtime/#{file}") }

%w{
  arithmetic
  comparison
  lists
  strings
}.each { |file| require_relative("./core/#{file}") }

module Fur
  module Runtime
    Base = Scope.new do |scope|
      scope.add_library(Core::Arithmetic)
      scope.add_library(Core::Comparison)
      scope.add_library(Core::Lists)
      scope.add_library(Core::Strings)
    end

    def self.call(program)
      program.call(Base).to_rb
    end
  end
end
