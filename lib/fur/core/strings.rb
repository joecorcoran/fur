module Fur
  module Core
    class Strings
      extend Runtime::Library
      extend Runtime::RustLibrary

      rust('libfur') do
        ff('passthru', [Runtime::String], Runtime::String)
      end

      define_function(:passthru, [Runtime::Param.new(:a, :str)]) do |scope|
        string = scope.get(:a)
        Runtime::String.from_ff(passthru.call(string.to_ff))
      end
    end
  end
end
