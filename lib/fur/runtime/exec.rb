module Fur
  module Runtime
    class Exec
      def initialize(name, args)
        @name, @args = name, args
      end

      def inspect
        "<Exec name=#{@name.inspect} args=#{@args.inspect}>"
      end

      def call(scope)
        function = @name.call(scope)
        check_arg_types!(function, scope)

        param_names = function.params.map { |param| param.call(scope) }
        assigns = Hash[param_names.zip(@args)]
        function_scope = scope.fork do |s|
          assigns.each do |name, value|
            s.set(name, value)
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
