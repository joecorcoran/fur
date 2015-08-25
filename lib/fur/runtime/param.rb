module Fur
  module Runtime
    class Param
      attr_reader :value, :tag

      def initialize(value, tag)
        @value, @tag = value, tag
      end

      def inspect
        "<Param #{@value}:#{@tag}>"
      end

      def type
        case @tag
        when :int then Integer
        when :str then String
        when :fun then Function
        end
      end

      def call(scope)
        @value
      end
    end
  end
end
