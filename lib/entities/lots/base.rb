# frozen_string_literal: true

module Entities
  module Lots
    class Base < Dry::Struct
      attribute :quantity, Types::Integer
    end
  end
end
