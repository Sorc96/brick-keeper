# frozen_string_literal: true

module Repos
  class ItemRepo < ROM::Repository[:parts]
    auto_struct false

    def find_by(color:, type:)
      parts
        .join(:colors)
        .join(:part_types)
        .where { { colors[:name] => color, part_types[:name] => type } }
        .select(:id, colors[:name].as(:color), part_types[:name].as(:part_type))
        .combine(:lots)
        .map_with(:items_mapper)
        .one
    end
  end
end
