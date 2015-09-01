module Fur
  module Runtime
    class List
      include Enumerable

      attr_reader :members

      def initialize(members)
        @members = members
      end

      def each(&block)
        @members.each(&block)
      end

      def inspect
        "<List #{@members.inspect}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @members.map(&:to_rb)
      end
    end
  end
end
