# frozen_string_literal: true

module Relations
  class Lots < ROM::Relation[:sql]
    schema(:lots, infer: true) do
      associations do
        belongs_to :part
      end
    end
  end
end
