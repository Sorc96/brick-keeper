# frozen_string_literal: true

module Import
  ROW_TYPE = Types::Array.of(Types::String.constructor(&:strip)).constrained(size: 4)
  BATCH_TYPE = Types::Array.of(ROW_TYPE)

  class << self
    def call(batch)
      BATCH_TYPE[batch]
      lot_repo.transaction do
        batch.each { |row| import_row(row) }
      end
    end

    def import_row(row)
      unless colors.exist?(name: row[0])
        colors.insert(name: row[0])
      end

      unless part_types.exist?(name: row[1])
        part_types.insert(name: row[1])
      end

      lot_repo.create(*row)
    end

    private

    def colors
      Container.resolve(:rom).relations[:colors]
    end

    def part_types
      Container.resolve(:rom).relations[:part_types]
    end

    def lot_repo
      Container.resolve(:lot_repo)
    end
  end
end
