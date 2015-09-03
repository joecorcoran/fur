module Fur
  module Runtime
    module Rust

      def rust(name, lib)
        path = Dir[File.expand_path("../../core/rust/#{lib}.*", __FILE__)].first
        value = Fiddle.dlopen(path)
        instance_variable_set("@#{name}", value)
        define_singleton_method(name) { instance_variable_get("@#{name}") }
      end
      
    end
  end
end
