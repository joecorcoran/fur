module Fur
  module Runtime
    Free = Fiddle::Function.new(
      Fiddle::RUBY_FREE,
      [Fiddle::TYPE_VOIDP],
      Fiddle::TYPE_VOID
    )
  end
end
