module Fur
  module Runtime
    class Integer < Primitive
      include Comparable

      attr_reader :value

      def self.ff_type
        Fiddle::TYPE_INT
      end

      def self.from_ff(ff)
        new(ff)
      end

      def initialize(value)
        @value = value
      end

      def inspect
        "<Integer #{@value}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @value.to_i
      end

      def to_ff
        @value.to_i
      end

      def <=>(other)
        [self.class, value] <=> [other.class, other.value]
      end
    end
  end
end
