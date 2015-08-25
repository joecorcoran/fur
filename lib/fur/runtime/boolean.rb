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

      def call(scope)
        self
      end

      def to_rb
        @value == '#t'
      end
    end
  end
end
