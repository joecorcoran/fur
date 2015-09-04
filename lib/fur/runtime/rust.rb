module Fur
  module Runtime
    module Rust

      def rust(lib, &block)
        path = Dir[File.expand_path("../../core/include/#{lib}.*", __FILE__)].first
        @handle = Fiddle.dlopen(path)
        instance_eval(&block)
      end

      def ff(name, params, return_type)
        define_singleton_method(name) do
          Fiddle::Function.new(@handle[name], params.map(&:ffi_type), return_type.ffi_type)
        end
      end

    end
  end
end
