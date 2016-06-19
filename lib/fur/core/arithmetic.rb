module Fur
  module Core
    class Arithmetic
      extend Runtime::Library
      extend Runtime::Libfur

      import(:add, [Runtime::Integer, Runtime::Integer], Runtime::Integer)
      import(:subtract, [Runtime::Integer, Runtime::Integer], Runtime::Integer)
      import(:multiply, [Runtime::Integer, Runtime::Integer], Runtime::Integer)
      import(:divide, [Runtime::Integer, Runtime::Integer], Runtime::Integer)

      define_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(add(a.to_ffi, b.to_ffi))
      end

      define_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(subtract(a.to_ffi, b.to_ffi))
      end

      define_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(multiply(a.to_ffi, b.to_ffi))
      end

      define_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Integer.from_ffi(divide(a.to_ffi, b.to_ffi))
      end
    end
  end
end
