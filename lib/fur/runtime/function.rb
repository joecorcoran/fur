module Fur
  module Runtime
    class Function
      attr_reader :name, :params, :body

      def initialize(name, params, body)
        @name, @params, @body = name, params, body
      end

      def inspect
        "(function #{@name.inspect} #{@params})"
      end

      def anon?
        name.nil?
      end

      def call(scope)
        anon? ? self : scope.set(@name.value, self)
      end

      def to_rb
        self
      end
    end
  end
end
