# frozen_string_literal: true

module Relations
  class Parts < ROM::Relation[:sql]
    schema(:parts, infer: true) do
      associations do
        belongs_to :part_type
        belongs_to :color
        has_many :lots
      end
    end

    def find_or_create(data)
      existing = where(data).one
      return existing.id if existing

      insert(data)
    end
  end
end
