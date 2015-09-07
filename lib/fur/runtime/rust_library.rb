module Fur
  module Runtime
    module RustLibrary

      def rust(lib, &block)
        path = Dir[File.expand_path(
          "../../../rust/fur/target/debug/#{lib}.{dll,dylib,so}",
          __FILE__
        )].first
        @handle = Fiddle.dlopen(path)
        instance_eval(&block)
      end

      def ff(name, params, return_type)
        define_singleton_method(name) do
          Fiddle::Function.new(@handle[name], params.map(&:ff_type), return_type.ff_type)
        end
      end

    end
  end
end
