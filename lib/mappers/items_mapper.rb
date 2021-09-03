# frozen_string_literal: true

require 'rom/transformer'

module Mappers
  class ItemsMapper < ROM::Transformer
    relation :parts, as: :items_mapper

    map do
      map_value :lots do
        map_array { create_lot }
      end
      create_item
    end

    def create_lot(lot)
      if lot[:unitprice].nil?
        Entities::Lots::WithoutPriceInfo.new(lot)
      else
        Entities::Lots::WithPriceInfo.new(lot)
      end
    end

    def create_item(row)
      Entities::Item.new(row)
    end
  end
end
