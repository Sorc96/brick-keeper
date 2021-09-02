require 'rom'
require 'rom-sql'
require_relative '../db/connection'

config = ROM::Configuration.new :sql, Db::Connection.connection_string

config.register_relation Relations::Colors
config.register_relation Relations::PartTypes
config.register_relation Relations::Parts
config.register_relation Relations::Lots

container = ROM.container(config)
container.gateways[:default].use_logger Logger.new($stdout)

Container.register :rom, container
