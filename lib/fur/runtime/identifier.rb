module Fur
  module Runtime
    class Identifier
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def inspect
        @value
      end

      def call(scope)
        scope.get(@value).call(scope)
      end
    end
  end
end
