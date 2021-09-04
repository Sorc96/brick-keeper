# frozen_string_literal: true

require 'dry-initializer'

class TableFormatter
  extend Dry::Initializer

  option :horizontal, default: -> { '-' }
  option :vertical, default: -> { '|' }
  option :corner, default: -> { '+' }

  def format(string)
    full_size = string.size + 4
    [
      horizontal_line(full_size),
      content_line(string),
      horizontal_line(full_size)
    ].join("\n")
  end

  private

  def horizontal_line(size)
    "#{corner}#{horizontal * (size-2)}#{corner}"
  end

  def content_line(string)
    "#{vertical} #{string} #{vertical}"
  end
end
