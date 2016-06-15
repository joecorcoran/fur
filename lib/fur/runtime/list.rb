module Fur
  module Runtime
    class List < Primitive
      include Enumerable

      attr_reader :members

      def self.ff_type
        Fiddle::TYPE_VOIDP
      end
      
      def self.struct_class
        Fiddle::CStructBuilder.create(
          Fiddle::CStruct,
          [member_ff_type, Fiddle::TYPE_VOIDP],
          ['size', 'data']
        )
      end

      def self.from_ff(pointer)
        struct = struct_class.new(pointer)
        members = struct.data[0, member_ff_size * struct.size].unpack('l*')
        new(members.map { |member| member_runtime_type.new(member) })
      end

      def self.member_ff_type
        raise NotImplementedError
      end

      def self.member_ff_size
        raise NotImplementedError
      end

      def self.member_runtime_type
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
        "<List #{@members.inspect}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @members.map(&:to_rb)
      end

      def to_ff
        struct = self.class.struct_class.malloc
        struct.size = length
        struct.data = to_rb.pack('l*')
        struct
      end
    end
  end
end
