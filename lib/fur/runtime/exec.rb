module Fur
  module Runtime
    class Exec
      def initialize(function, args)
        @function, @args = function, args
      end

      def inspect
        @function.inspect
      end

      def call(scope)
        function = Function === @function ? @function : @function.call(scope)

        check_arg_types!(function, scope)

        param_names = function.params.map { |param| param.call(scope) }
        assigns = Hash[param_names.zip(@args)]

        function_scope = scope.fork do |s|
          assigns.each do |name, value|
            s.set(name, value.call(s))
          end
        end

        function.body.call(function_scope)
      end

      private

      def check_arg_types!(function, scope)
        function.params.map.with_index do |param, idx|
          arg = @args[idx].call(scope)
          raise TypeError.new(arg, param.type) unless param.type === arg
        end
      end
    end
  end
end
