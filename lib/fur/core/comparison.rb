module Fur
  module Core
    class Comparison
      extend Runtime::Library
      extend Runtime::Rust

      rust('libcomparison') do
        ff('eq', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('gt', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('lt', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('lte', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('gte', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      end

      define_function(:eq, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(eq.call(a.to_ffi, b.to_ffi))
      end

      define_function(:lt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(lt.call(a.to_ffi, b.to_ffi))
      end

      define_function(:gt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(gt.call(a.to_ffi, b.to_ffi))
      end

      define_function(:lte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(lte.call(a.to_ffi, b.to_ffi))
      end

      define_function(:gte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ffi(gte.call(a.to_ffi, b.to_ffi))
      end
    end
  end
end
