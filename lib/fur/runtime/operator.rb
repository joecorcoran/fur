module Fur
  module Runtime
    class Operator
      def initialize(value)
        @value = value
      end

      def inspect
        "<Operator #{@value}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @value
      end
    end
  end
end
