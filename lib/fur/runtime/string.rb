require 'fur/runtime/primitive'

module Fur
  module Runtime
    class String < Primitive
      def self.ffi_type
        :string
      end

      def self.from_ffi(string, &block)
        block.call if block_given?
        new(string.force_encoding('UTF-8'))
      end

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

      def to_ffi
        to_rb.force_encoding('UTF-8')
      end
    end
  end
end
