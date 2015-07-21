module Flua
  module Compiler
    def self.passes
      [
        NativeIntegers.new,
        NativeStrings.new,
        FunctionDefs.new
      ]
    end

    def self.call(ast)
      passes.reduce(ast) do |ast, pass|
        pass.call(ast)
      end
    end

    class Pass
      def call(ast)
        result = ast.dup
        result.map do |child|
          if Array === child
            child = transform_list?(child) ? transform_list(child) : child
            call(child)
          else
            transform_terminal?(child) ? transform_terminal(child) : child
          end
        end
      end

      def transform_list?(list)
        false
      end

      def transform_list(list)
        raise NotImplementedError
      end

      def transform_terminal?(terminal)
        false
      end

      def transform_terminal(terminal)
        raise NotImplementedError
      end
    end

    class NativeIntegers < Pass
      def transform_terminal?(terminal)
        AST::Integer === terminal
      end

      def transform_terminal(terminal)
        terminal.value.to_i
      end
    end

    class NativeStrings < Pass
      def transform_terminal?(terminal)
        AST::String === terminal
      end

      def transform_terminal(terminal)
        terminal.value.to_s
      end
    end

    class FunctionDefs < Pass
      def transform_list?(list)
        AST::Symbol === list[0] && list[0].value == 'fn'
      end

      def transform_list(list)
        [AST::Function.new(list[0]), list[1..-1]]
      end
    end

  end
end
