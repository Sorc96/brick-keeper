# frozen_string_literal: true

module Entities
  module Lots
    class WithPriceInfo < Base
      attribute :unitprice, Types::Decimal

      def with_price_info?
        true
      end

      def total_price
        unitprice * quantity
      end
    end
  end
end
