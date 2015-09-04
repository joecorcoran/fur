module Fur
  module Runtime
    class Boolean
      attr_reader :value

      def self.ffi_type
        Fiddle::TYPE_INT
      end

      def self.from_ffi(ffi)
        ffi == 1 ? new(:"#t") : new(:"#f")
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

      def to_ffi
        symbol == :"#t" ? 1 : 0
      end
    end
  end
end
