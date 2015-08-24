%w{
  errors exec function identifier integer operation operator param
  scope string tree
}.each { |file| require_relative("./runtime/#{file}") }

%w{
  maths
}.each { |file| require_relative("./stdlib/#{file}") }

module Fur
  module Runtime
    Base = Scope.new do |scope|
      scope.add_library(Stdlib::Maths)
    end

    def self.call(program)
      program.call(Base).to_rb
    end
  end
end

