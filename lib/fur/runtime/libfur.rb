module Fur
  module Runtime
    module Libfur
      include FFI::Library

      def self.extended(mod)
        mod.ffi_lib(:libfur)
      end
      
      def ffi_lib(path)
        lib_path = Dir[File.expand_path(
          "../../../rust/fur/target/debug/#{path}.{dll,dylib,so}",
          __FILE__
        )].first
        super(lib_path)
      end

      def attach_function(name, args = [], ret)
        args.map! { |a| a.ffi_type }
        super(name, args, ret.ffi_type)
      end
      alias :import :attach_function
    end
  end
end
