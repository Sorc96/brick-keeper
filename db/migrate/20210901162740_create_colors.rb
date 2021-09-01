# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :colors do
      primary_key :id
      column :name, :string, null: false
    end
  end
end
