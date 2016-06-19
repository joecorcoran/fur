require 'fur/runtime/primitive'

module Fur
  module Runtime
    class Integer < Primitive
      include Comparable

      attr_reader :value

      def self.ffi_type
        :int
      end

      def self.from_ffi(int)
        new(int)
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

      def to_ffi
        @value.to_i
      end

      def <=>(other)
        [self.class, value] <=> [other.class, other.value]
      end
    end
  end
end
