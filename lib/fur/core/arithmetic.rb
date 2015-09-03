require 'fiddle'

module Fur
  module Core
    class Arithmetic
      extend Runtime::Library
      extend Runtime::Rust

      rust(:arithmetic, 'libarithmetic')

      define_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        fn = Fiddle::Function.new(arithmetic['fur_add'], [Fiddle::TYPE_INT, Fiddle::TYPE_INT], Fiddle::TYPE_INT)
        Runtime::Integer.new(fn.call(a.to_rb, b.to_rb))
      end

      define_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        fn = Fiddle::Function.new(arithmetic['fur_subtract'], [Fiddle::TYPE_INT, Fiddle::TYPE_INT], Fiddle::TYPE_INT)
        Runtime::Integer.new(fn.call(a.to_rb, b.to_rb))
      end

      define_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        fn = Fiddle::Function.new(arithmetic['fur_multiply'], [Fiddle::TYPE_INT, Fiddle::TYPE_INT], Fiddle::TYPE_INT)
        Runtime::Integer.new(fn.call(a.to_rb, b.to_rb))
      end

      define_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        fn = Fiddle::Function.new(arithmetic['fur_divide'], [Fiddle::TYPE_INT, Fiddle::TYPE_INT], Fiddle::TYPE_INT)
        Runtime::Integer.new(fn.call(a.to_rb, b.to_rb))
      end
    end
  end
end
