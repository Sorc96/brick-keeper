require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    require 'rom'
    require 'rom-sql'

    ROM::SQL::RakeSupport.env = ROM.container :sql, 'sqlite://db/brick_keeper.sqlite'
  end
end
