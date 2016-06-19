module Fur
  module Core
    class Strings
      extend Runtime::Library
      extend Runtime::Libfur

      import(:reverse, [Runtime::String], Runtime::String)

      define_function(:reverse, [Runtime::Param.new(:a, :str)]) do |scope|
        string = scope.get(:a)
        Runtime::String.from_ffi(reverse(string.to_ffi))
      end
    end
  end
end

