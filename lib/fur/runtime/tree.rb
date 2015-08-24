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
        "<Tree children=#{@children.inspect}>"
      end

      def call(scope)
        map { |child| child.call(scope) }.last
      end
    end
  end
end
