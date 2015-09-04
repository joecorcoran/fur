module Fur
  module Core
    class Arithmetic
      extend Runtime::Library
      extend Runtime::Rust

      rust('libarithmetic') do
        ff('add', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('subtract', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('multiply', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
        ff('divide', [Runtime::Integer, Runtime::Integer], Runtime::Integer)
      end

      define_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(add.call(a.to_ffi, b.to_ffi))
      end

      define_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(subtract.call(a.to_ffi, b.to_ffi))
      end

      define_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(multiply.call(a.to_ffi, b.to_ffi))
      end

      define_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(divide.call(a.to_ffi, b.to_ffi))
      end
    end
  end
end
