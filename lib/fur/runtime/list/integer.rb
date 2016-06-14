module Fur
  module Runtime
    class List::Integer < List
      def self.member_ff_type
        Fiddle::TYPE_INT
      end

      def self.member_ff_size
        Fiddle::SIZEOF_INT
      end

      def self.member_runtime_type
        Runtime::Integer
      end
    end
  end
end
