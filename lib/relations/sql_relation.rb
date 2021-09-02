# frozen_string_literal: true

module Relations
  class SqlRelation < ROM::Relation[:sql]
    def pick(column)
      select(column).one![column]
    end
  end
end
