# frozen_string_literal: true

module Db
  module Connection
    def self.connection_string
      db_name = ENV.fetch('DB_NAME', 'brick_keeper')
      "sqlite://db/#{db_name}.sqlite"
    end
  end
end
