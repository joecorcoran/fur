module Fur
  module Runtime
    def self.call(program)
      program.call(Base)
    end

    class Scope
      def initialize(parent = nil, &block)
        @parent, @register = parent, {}
        block.call(self) if block_given?
      end

      def get(name)
        @register[name] || (@parent && @parent.get(name)) || raise("#{name} not found!")
      end

      def set(name, value)
        @register[name] = value
      end

      def fork(&block)
        fork = self.class.new(self)
        block.call(fork) if block_given?
        fork
      end
    end

    Base = Scope.new

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
        @value
      end
    end

    class Identifier
      attr_reader :value

      def initialize(value)
        @value = value
      end

      def symbol
        @symbol ||= @value.to_sym
      end

      def inspect
        "<Identifier #{@value}>"
      end

      def call(scope)
        scope.get(symbol).call(scope)
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

      def param_names
        @params.map(&:symbol)
      end

      def call(scope)
        scope.set(@name.symbol, self)
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
        assigns = Hash[function.param_names.zip(@args)]
        function_scope = scope.fork do |s|
          assigns.each do |name, value|
            s.set(name, value)
          end
        end
        function.body.call(function_scope)
      end
    end
  end
end

