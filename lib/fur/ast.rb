require 'treetop'

module Fur
  class Tree < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Tree.new(elements.map(&:call).compact)
    end
  end

  class Exp < Treetop::Runtime::SyntaxNode
    def call
      body.call
    end
  end

  class Function < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Function.new(name.call, params.elements.map(&:call).compact, body.call)
    end
  end

  class Exec < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Exec.new(name.call, args.elements.map(&:call).compact)
    end
  end

  class String < Treetop::Runtime::SyntaxNode
    def call
      Runtime::String.new(body.text_value)
    end
  end

  class Integer < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Integer.new(text_value)
    end
  end

  class Identifier < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Identifier.new(text_value.to_sym)
    end
  end

  class Param < Treetop::Runtime::SyntaxNode
    def call
      Runtime::Param.new(name.text_value.to_sym, tag.text_value.to_sym)
    end
  end

  class Space < Treetop::Runtime::SyntaxNode
    def call
      nil
    end
  end
end
