module Fur
  module Core
    class Comparison
      extend Runtime::Library

      define_function(:equal, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        if scope.get(:a).call(scope) == scope.get(:b).call(scope)
          Runtime::Boolean.new(:"#t")
        else
          Runtime::Boolean.new(:"#f")
        end
      end

      define_function(:lt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        if scope.get(:a).call(scope) < scope.get(:b).call(scope)
          Runtime::Boolean.new(:"#t")
        else
          Runtime::Boolean.new(:"#f")
        end
      end

      define_function(:gt, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        if scope.get(:a).call(scope) > scope.get(:b).call(scope)
          Runtime::Boolean.new(:"#t")
        else
          Runtime::Boolean.new(:"#f")
        end
      end

      define_function(:lte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        if scope.get(:a).call(scope) <= scope.get(:b).call(scope)
          Runtime::Boolean.new(:"#t")
        else
          Runtime::Boolean.new(:"#f")
        end
      end

      define_function(:gte, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do |scope|
        if scope.get(:a).call(scope) >= scope.get(:b).call(scope)
          Runtime::Boolean.new(:"#t")
        else
          Runtime::Boolean.new(:"#f")
        end
      end
    end
  end
end
