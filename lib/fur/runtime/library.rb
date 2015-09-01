module Fur
  module Runtime
    module Library
      extend Enumerable

      def each(&block)
        functions.each(&block)
      end

      def functions
        @functions ||= {}
      end

      def define_function(name, params = [], &body)
        functions[name] = Function.new(Identifier.new(name), params, body)
      end
    end
  end
end
