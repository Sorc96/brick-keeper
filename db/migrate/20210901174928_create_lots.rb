# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :lots do
      primary_key :id
      foreign_key :part_id, :parts, null: false
      column :quantity, :integer, null: false
      column :unitprice, :decimal, precision: 10, scale: 2
    end
  end
end
