# frozen_string_literal: true

module Repos
  class ItemRepo < ROM::Repository[:parts]
    ITEM_MAPPER = ->(relation) {
      relation.map do |data|
        Entities::Item.new(
          lots: data.lots.map(&LOT_MAPPER),
          color: data.color.name,
          part_type: data.part_type.name
        )
      end
    }

    LOT_MAPPER = ->(lot) {
      if lot.unitprice.nil?
        Entities::Lots::WithoutPriceInfo.new(lot)
      else
        Entities::Lots::WithPriceInfo.new(lot)
      end
    }

    def find_by(color:, type:)
      (parts >> ITEM_MAPPER)
        .join(:colors)
        .join(:part_types)
        .combine(:colors, :part_types, :lots)
        .where { { colors[:name] => color, part_types[:name] => type } }
        .one
    end
  end
end
