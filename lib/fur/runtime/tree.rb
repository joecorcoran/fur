module Fur
  module Runtime
    class Tree
      include Enumerable

      def initialize(children)
        @children = children
      end

      def each(&block)
        @children.each(&block)
      end

      def inspect
        "(tree #{@children.map(&:inspect)})"
      end

      def call(scope)
        map { |child| child.call(scope) }.last
      end
    end
  end
end
