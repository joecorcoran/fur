module Fur
  module Runtime
    class Operation
      include Enumerable

      def initialize(returns, children)
        @returns, @children = returns, children
      end

      def each(&block)
        @children.each(&block)
      end

      def inspect
        "<Operation returns=#{@returns} children=#{@children.inspect}>"
      end

      def call(scope)
        ruby = map { |child| child.call(scope).to_rb }.join(' ')
        result = Kernel.eval(ruby)
        @returns.new(result)
      end
    end
  end
end
