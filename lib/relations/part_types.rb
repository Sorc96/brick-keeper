# frozen_string_literal: true

module Relations
  class PartTypes < SqlRelation
    schema(:part_types, infer: true) do
      associations do
        has_many :parts
      end
    end
  end
end
