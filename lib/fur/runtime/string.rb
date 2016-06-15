module Fur
  module Runtime
    class String < Primitive
      def self.ff_type
        Fiddle::TYPE_VOIDP
      end

      def self.struct_class
        Fiddle::CStructBuilder.create(
          Fiddle::CStruct,
          [Fiddle::TYPE_INT, Fiddle::TYPE_VOIDP],
          ['size', 'data']
        )
      end

      def self.from_ff(pointer)
        struct = struct_class.new(pointer)
        value = struct.data[0, Fiddle::SIZEOF_INT * struct.size].unpack('l*')
        new(value.pack('U*'))
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

      def to_ff
        struct = self.class.struct_class.malloc
        points = to_rb.unpack('U*')
        struct.size = points.length 
        struct.data = points.pack('l*')
        struct
      end
    end
  end
end
