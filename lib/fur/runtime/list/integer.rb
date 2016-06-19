module Fur
  module Runtime
    class List::Integer < List
      def self.ffi_struct
        @ffi_struct ||= Class.new(FFI::Struct) do
          layout(size: :int, data: :pointer)
        end
      end

      def self.from_ffi(ptr)
        str = ffi_struct.new(ptr)
        members = str[:data].read_array_of_int(str[:size])
        new(members.map { |member| Runtime::Integer.new(member) })
      end

      def to_ffi
        str = self.class.ffi_struct.new
        str[:size] = length
        str[:data] = FFI::MemoryPointer.new(:int, length)
        str[:data].write_array_of_int(to_rb)
        str.to_ptr
      end
    end
  end
end
