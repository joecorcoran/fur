module Fur
  module Core
    class Lists
      extend Runtime::Library

      define_function(:head, [Runtime::Param.new(:a, :list)]) do |scope|
        list = scope.get(:a)
        raise Runtime::EmptyList.new(:head) unless list.any?
        list.members[0].call(scope)
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
        list.members[-1].call(scope)
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
