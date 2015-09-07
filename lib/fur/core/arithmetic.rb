module Fur
  module Core
    class Arithmetic
      extend Runtime::Library
      extend Runtime::RustLibrary

      rust('libfur') do
        ff('add', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('subtract', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('multiply', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('divide', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
      end

      define_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ff(add.call(a.to_ff, b.to_ff))
      end

      define_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ff(subtract.call(a.to_ff, b.to_ff))
      end

      define_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ff(multiply.call(a.to_ff, b.to_ff))
      end

      define_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ff(divide.call(a.to_ff, b.to_ff))
      end
    end
  end
end
