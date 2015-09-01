module Fur
  module Core
    Arithmetic = ->(context) do
      context.set_function(:add, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:+), Runtime::Identifier.new(:b)]
        )
      end

      context.set_function(:subtract, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:-), Runtime::Identifier.new(:b)]
        )
      end

      context.set_function(:multiply, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:*), Runtime::Identifier.new(:b)]
        )
      end

      context.set_function(:divide, [Runtime::Param.new(:a, :int), Runtime::Param.new(:b, :int)]) do
        Runtime::Operation.new(
          Runtime::Integer,
          [Runtime::Identifier.new(:a), Runtime::Operator.new(:/), Runtime::Identifier.new(:b)]
        )
      end
    end
  end
end
