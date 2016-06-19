module Fur
  module Core
    class Comparison
      extend Runtime::Library
      extend Runtime::Libfur

      import(:eq, [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      import(:lt, [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      import(:gt, [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      import(:lte, [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      import(:gte, [Runtime::Integer, Runtime::Integer], Runtime::Boolean)

      define_function(:eq, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(eq(a.to_ffi, b.to_ffi))
      end

      define_function(:lt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(lt(a.to_ffi, b.to_ffi))
      end

      define_function(:gt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(gt(a.to_ffi, b.to_ffi))
      end

      define_function(:lte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(lte(a.to_ffi, b.to_ffi))
      end

      define_function(:gte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(gte(a.to_ffi, b.to_ffi))
      end
    end
  end
end
