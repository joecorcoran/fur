module Fur
  module Runtime
    class Boolean
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def inspect
        "<Boolean #{@value}>"
      end

      def symbol
        @symbol ||= @value.to_sym
      end

      def call(scope)
        self
      end

      def to_rb
        symbol == :"#t"
      end
    end
  end
end
