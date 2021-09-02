require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    require 'rom'
    require 'rom-sql'
    require_relative 'db/connection'

    ROM::SQL::RakeSupport.env = ROM.container :sql, Db::Connection.connection_string
  end
end
