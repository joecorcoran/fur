module Fur
  module Runtime
    class String
      def initialize(value)
        @value = value
      end

      def inspect
        "<String #{@value.inspect}>"
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
