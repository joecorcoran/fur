module Fur
  module Core
    class Lists
      extend Runtime::Library
      extend Runtime::RustLibrary

      rust('libfur') do
        ff('head', [Runtime::List::Integer], Runtime::Integer)
        ff('tail', [Runtime::List::Integer], Runtime::List)
        ff('last', [Runtime::List::Integer], Runtime::Integer)
      end

      define_function(:head, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:head) unless list.any?
        Runtime::Integer.from_ff(head.call(list.to_ff))
      end

      define_function(:tail, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:tail) unless list.any?
        Runtime::List::Integer.from_ff(tail.call(list.to_ff))
      end

      define_function(:last, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:last) unless list.any?
        Runtime::Integer.from_ff(last.call(list.to_ff))
      end

      define_function(:map, [Runtime::Param.new(:a, :list), Runtime::Param.new(:b, :fn)]) do |scope|
        list, function = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::List::Integer.new(
          list.map do |member|
            Runtime::Exec.new(function, [member.call(scope)]).call(scope)
          end
        )
      end
    end
  end
end
