# frozen_string_literal: true

module Repos
  class LotRepo < ROM::Repository[:lots]
    def create(color, type, quantity, unitprice = nil)
      lots.transaction do
        color_id = colors.where(name: color).pick(:id)
        type_id = part_types.where(name: type).pick(:id)
        part_id = parts.find_or_create(color_id: color_id, part_type_id: type_id)
        lots.insert(
          part_id: part_id,
          quantity: quantity,
          unitprice: unitprice
        )
      end
    end
  end
end
