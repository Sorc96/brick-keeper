require 'rom'
require 'rom-sql'

config = ROM::Configuration.new :sql, 'sqlite://db/brick_keeper.sqlite'

config.register_relation Relations::Colors
config.register_relation Relations::PartTypes
config.register_relation Relations::Parts

DB = ROM.container config
