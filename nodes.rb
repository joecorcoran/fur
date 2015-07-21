require 'treetop'

module Flua
  class Program < Treetop::Runtime::SyntaxNode
    def call
      elements.map(&:call)
    end
  end

  class List < Treetop::Runtime::SyntaxNode
    def call
      members.elements.map(&:call).compact
    end
  end

  class String < Treetop::Runtime::SyntaxNode
    def call
      AST::String.new(body.text_value)
    end
  end

  class Integer < Treetop::Runtime::SyntaxNode
    def call
      AST::Integer.new(text_value)
    end
  end

  class Symbol < Treetop::Runtime::SyntaxNode
    def call
      AST::Symbol.new(text_value)
    end
  end

  class Space < Treetop::Runtime::SyntaxNode
    def call
      nil
    end
  end

  module AST
    class Terminal
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def inspect
        "<#{self.class.name}/#{value}>"
      end
    end

    class String < Terminal; end
    class Integer < Terminal; end
    class Symbol < Terminal; end
    class Function < Terminal; end
    class Native < Terminal; end
  end
end
