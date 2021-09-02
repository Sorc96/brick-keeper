# frozen_string_literal: true

module Relations
  class Colors < SqlRelation
    schema(:colors, infer: true) do
      associations do
        has_many :parts
      end
    end
  end
end
