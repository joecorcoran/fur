module Fur
  module Stdlib
    Maths = ->(scope) do
      scope.set_function(:equal, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        ->(scope) do
          if scope.get(:a).call(scope) == scope.get(:b).call(scope)
            Runtime::Boolean.new(:"#t")
          else
            Runtime::Boolean.new(:"#f")
          end
        end
      end

      scope.set_function(:lt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        ->(scope) do
          if scope.get(:a).call(scope) < scope.get(:b).call(scope)
            Runtime::Boolean.new(:"#t")
          else
            Runtime::Boolean.new(:"#f")
          end
        end
      end

      scope.set_function(:gt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        ->(scope) do
          if scope.get(:a).call(scope) > scope.get(:b).call(scope)
            Runtime::Boolean.new(:"#t")
          else
            Runtime::Boolean.new(:"#f")
          end
        end
      end

      scope.set_function(:lte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        ->(scope) do
          if scope.get(:a).call(scope) <= scope.get(:b).call(scope)
            Runtime::Boolean.new(:"#t")
          else
            Runtime::Boolean.new(:"#f")
          end
        end
      end

      scope.set_function(:gte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        ->(scope) do
          if scope.get(:a).call(scope) >= scope.get(:b).call(scope)
            Runtime::Boolean.new(:"#t")
          else
            Runtime::Boolean.new(:"#f")
          end
        end
      end

      scope.set_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:+), Runtime::Identifier.new(:b)]
        )
      end

      scope.set_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:-), Runtime::Identifier.new(:b)]
        )
      end

      scope.set_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:*), Runtime::Identifier.new(:b)]
        )
      end

      scope.set_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:/), Runtime::Identifier.new(:b)]
        )
      end
    end
  end
end
