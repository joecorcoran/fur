module Fur
  module Runtime
    class Primitive
      def self.ff_type
        raise NotImplementedError
      end
      
      def self.struct_class
        raise NotImplementedError
      end

      def self.from_ff(pointer)
        raise NotImplementedError
      end

      def to_ff
        raise NotImplementedError
      end
    end
  end
end
