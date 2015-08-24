module Fur
  module Runtime
    class Function
      attr_reader :name, :params, :body

      def initialize(name, params, body)
        @name, @params, @body = name, params, body
      end

      def inspect
        "<Function name=#{@name.inspect} params=#{@params.inspect} body=#{@body.inspect}>"
      end

      def call(scope)
        scope.set(@name.value, self)
      end
    end
  end
end
