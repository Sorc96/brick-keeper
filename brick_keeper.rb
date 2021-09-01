require 'pry'

require_relative 'config/zeitwerk'
require_relative 'config/container'
require_relative 'config/db'

def resolve(key)
  Container[key]
end

def db
  resolve(:rom)
end

binding.pry
