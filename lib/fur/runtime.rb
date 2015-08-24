module Fur
  module Runtime
    def self.call(program)
      program.call(Base).to_rb
    end

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

    class String
      def initialize(value)
        @value = value
      end

      def inspect
        "<String #{@value.inspect}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @value
      end
    end

    class Integer
      def initialize(value)
        @value = value
      end

      def inspect
        "<Integer #{@value}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @value.to_i
      end
    end

    class Identifier
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def inspect
        "<Identifier #{@value}>"
      end

      def call(scope)
        scope.get(@value).call(scope)
      end
    end

    class Param
      attr_reader :value, :tag

      def initialize(value, tag)
        @value, @tag = value, tag
      end

      def inspect
        "<Param #{@value}:#{@tag}>"
      end

      def type
        case @tag
        when :int then Integer
        when :str then String
        end
      end

      def call(scope)
        @value
      end
    end

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

    class Operator
      def initialize(value)
        @value = value
      end

      def inspect
        "<Operator #{@value}>"
      end

      def call(scope)
        self
      end

      def to_rb
        @value
      end
    end

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

    class Scope
      def initialize(parent = nil, &block)
        @parent, @register = parent, {}
        block.call(self) if block_given?
      end

      def get(name)
        @register[name] || (@parent && @parent.get(name)) || raise(LookupError.new(name))
      end

      def set(name, value)
        @register[name] = value
      end

      def set_function(name, params, &block)
        set(name, Function.new(Identifier.new(name), params, block.call))
      end

      def fork(&block)
        fork = self.class.new(self)
        block.call(fork) if block_given?
        fork
      end
    end

    class TypeError < StandardError
      def initialize(arg, type)
        @arg, @type = arg, type
      end

      def message
        "Expected #{@arg.inspect} to be a #{@type.name}"
      end
    end

    class LookupError < StandardError
      def initialize(name)
        @name = name
      end

      def message
        "Identifier #{@name} not found"
      end
    end

    Base = Scope.new do |scope|
      scope.set_function(:add, [Param.new(:a, :int), Param.new(:b, :int)]) do
        Operation.new(Integer, [Identifier.new(:a), Operator.new(:+), Identifier.new(:b)])
      end
      scope.set_function(:subtract, [Param.new(:a, :int), Param.new(:b, :int)]) do
        Operation.new(Integer, [Identifier.new(:a), Operator.new(:-), Identifier.new(:b)])
      end
      scope.set_function(:multiply, [Param.new(:a, :int), Param.new(:b, :int)]) do
        Operation.new(Integer, [Identifier.new(:a), Operator.new(:*), Identifier.new(:b)])
      end
      scope.set_function(:divide, [Param.new(:a, :int), Param.new(:b, :int)]) do
        Operation.new(Integer, [Identifier.new(:a), Operator.new(:/), Identifier.new(:b)])
      end
    end
  end
end

