# frozen_string_literal: true

module Relations
  class Parts < ROM::Relation[:sql]
    schema(:parts, infer: true) do
      associations do
        belongs_to :part_type
        belongs_to :color
      end
    end
  end
end
