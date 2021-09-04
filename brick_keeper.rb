require 'pry'

require_relative 'config/zeitwerk'
require_relative 'config/container'
require_relative 'config/db'
require_relative 'config/types'

def resolve(key)
  Container[key]
end

def db
  resolve(:rom)
end

def info(color, type)
  part = find_part(color, type)
  return puts("Part not found") if part.nil?

  puts format_item(part)
end

def find_part(color, type)
  resolve(:item_repo).find_by(color: color, type: type)
end

def format_item(part)
  formatter = TableFormatter.new
  info_string = "#{part.color} #{part.part_type} | #{part.quantity} total | #{part.average_price.to_f} average per piece"
  formatter.format(info_string)
end

binding.pry
