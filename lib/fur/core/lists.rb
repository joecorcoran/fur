module Fur
  module Core
    class Lists
      extend Runtime::Library
      extend Runtime::RustLibrary

      rust('libfur') do
        ff('head', [Runtime::List, Runtime::Integer], Runtime::Integer)
        ff('last', [Runtime::List, Runtime::Integer], Runtime::Integer)
      end

      define_function(:head, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:head) unless list.any?
        Runtime::Integer.new(head.call(list.to_ff, list.length))
      end

      define_function(:tail, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:tail) unless list.any?
        Runtime::List.new(
          list.members[1..-1].map { |member| member.call(scope) }
        )
      end

      define_function(:last, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:last) unless list.any?
        Runtime::Integer.new(last.call(list.to_ff, list.length))
      end

      define_function(:map, [Runtime::Param.new(:a, :list), Runtime::Param.new(:b, :fn)]) do |scope|
        list, function = scope.get(:a).call(scope), scope.get(:b).call(scope)
        Runtime::List.new(
          list.map do |member|
            Runtime::Exec.new(function, [member.call(scope)]).call(scope)
          end
        )
      end
    end
  end
end
