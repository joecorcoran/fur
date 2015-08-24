module Fur
  module Runtime
    class TypeError < StandardError
      def initialize(arg, type)
        @arg, @type = arg, type
      end

      def message
        "Expected #{@arg.inspect} to be a #{@type.name}"
      end
    end

    class LookupError < StandardError
      def initialize(name)
        @name = name
      end

      def message
        "Identifier #{@name} not found"
      end
    end
  end
end
