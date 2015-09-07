module Fur
  module Core
    class Comparison
      extend Runtime::Library
      extend Runtime::RustLibrary

      rust('libfur') do
        ff('eq', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('gt', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('lt', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('lte', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
        ff('gte', [Runtime::Integer, Runtime::Integer], Runtime::Boolean)
      end

      define_function(:eq, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ff(eq.call(a.to_ff, b.to_ff))
      end

      define_function(:lt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ff(lt.call(a.to_ff, b.to_ff))
      end

      define_function(:gt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ff(gt.call(a.to_ff, b.to_ff))
      end

      define_function(:lte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ff(lte.call(a.to_ff, b.to_ff))
      end

      define_function(:gte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        a, b = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::Boolean.from_ff(gte.call(a.to_ff, b.to_ff))
      end
    end
  end
end
