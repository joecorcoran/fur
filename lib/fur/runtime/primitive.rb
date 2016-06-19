module Fur
  module Runtime
    class Primitive
      def self.ffi_type
        raise NotImplementedError
      end
      
      def self.from_ffi(pointer)
        raise NotImplementedError
      end

      def to_ffi
        raise NotImplementedError
      end
    end
  end
end
