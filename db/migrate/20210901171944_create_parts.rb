# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :parts do
      primary_key :id
      foreign_key :part_type_id, :part_types, null: false
      foreign_key :color_id, :colors, null: false
    end
  end
end
