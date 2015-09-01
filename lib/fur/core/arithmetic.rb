module Fur
  module Core
    class Arithmetic
      extend Runtime::Library

      define_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.new(a.to_rb + b.to_rb)
      end

      define_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.new(a.to_rb - b.to_rb)
      end

      define_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.new(a.to_rb * b.to_rb)
      end

      define_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.new(a.to_rb / b.to_rb)
      end
    end
  end
end
