require 'fur/runtime/primitive'

module Fur
  module Runtime
    class List < Primitive
      include Enumerable

      attr_reader :members

      def self.ffi_type
        :pointer
      end

      def self.ffi_struct
        raise NotImplementedError
      end

      def self.from_ffi(*)
        raise NotImplementedError
      end

      def initialize(members)
        @members = members
      end

      def each(&block)
        @members.each(&block)
      end

      def length
        @members.length
      end

      def inspect
        "(list #{@members})"
      end

      def call(scope)
        self
      end

      def to_rb
        @members.map(&:to_rb)
      end

      def to_ffi
        raise NotImplementedError
      end
    end
  end
end
