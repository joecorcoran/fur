module Fur
  module Core
    Comparison = ->(scope) do
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
    end
  end
end
