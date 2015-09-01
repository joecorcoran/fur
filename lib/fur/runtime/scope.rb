module Fur
  module Runtime
    class Scope
      attr_reader :parent, :register

      def initialize(parent = nil, &block)
        @parent, @register = parent, {}
        block.call(self) if block_given?
      end

      def inspect
        "<Scope #{@register.inspect}>"
      end

      def get(name)
        @register[name] || (@parent && @parent.get(name)) || raise(LookupError.new(name))
      end

      def set(name, value)
        @register[name] = value
      end

      def add_library(library)
        library.each { |name, function| set(name, function) }
      end

      def fork(&block)
        fork = self.class.new(self)
        block.call(fork) if block_given?
        fork
      end
    end
  end
end
