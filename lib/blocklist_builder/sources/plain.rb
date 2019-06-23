# frozen_string_literal: true

module BlocklistBuilder::Sources
  class Plain < Source
    protected

    def read_data
      raw_data
        .split("\n")
        .compact
    end
  end
end
