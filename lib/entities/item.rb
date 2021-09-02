# frozen_string_literal: true

module Entities
  class Item < Dry::Struct
    attribute :lots, Types::Array.of(Lots::Base)
    attribute :color, Types::String
    attribute :part_type, Types::String

    def average_price
      return nil if priced_lots.empty?

      total_price / priced_lots.sum(&:quantity)
    end

    def quantity
      lots.sum(&:quantity)
    end

    def priced_lots
      lots.select(&:with_price_info?)
    end

    def total_price
      priced_lots.sum(&:total_price)
    end
  end
end
