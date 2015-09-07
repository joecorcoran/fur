module Fur
  module Runtime
    class Boolean
      attr_reader :value

      def self.ff_type
        Fiddle::TYPE_INT
      end

      def self.from_ff(ff)
        ff == 1 ? new(:"#t") : new(:"#f")
      end

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

      def to_ff
        symbol == :"#t" ? 1 : 0
      end
    end
  end
end
