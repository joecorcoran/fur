module Fur
  module Runtime
    class List
      include Enumerable

      attr_reader :members

      def self.ff_type
        Fiddle::TYPE_VOIDP
      end

      def self.from_ff(ffi)
        raise 'dunno yet'
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
        "<List #{@members.inspect}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @members.map(&:to_rb)
      end

      def to_ff
        tmp = to_rb
        @pointer = Fiddle::Pointer.malloc(Fiddle::SIZEOF_INT * tmp.length, Free)
        tmp.each.with_index do |member, idx|
          offset = idx == 0 ? idx : idx * Fiddle::SIZEOF_INT
          @pointer[offset] = member
        end
        @pointer
      end
    end
  end
end
