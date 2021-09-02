# frozen_string_literal: true

module Entities
  module Lots
    class WithoutPriceInfo < Base
      def with_price_info?
        false
      end
    end
  end
end
