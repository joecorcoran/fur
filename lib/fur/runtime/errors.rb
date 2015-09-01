module Fur
  module Runtime
    class Error < StandardError
      def inspect
        "#{self.class.name}! #{message}"
      end
    end

    class TypeError < Error
      def initialize(arg, type)
        @arg, @type = arg, type
      end

      def message
        "Expected #{@arg.inspect} to be a #{@type.name}"
      end
    end

    class LookupError < Error
      def initialize(identifier_name)
        @identifier_name = identifier_name
      end

      def message
        "Identifier #{@identifier_name} not found"
      end
    end

    class EmptyList < Error
      def initialize(function_name)
        @function_name = function_name
      end

      def message
        "#{@function_name} cannot accept an empty list"
      end
    end

    class InvalidParamType < Error
      def initialize(tag)
        @tag = tag
      end

      def message
        "#{@tag} is not a valid parameter type"
      end
    end
  end
end
