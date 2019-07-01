# frozen_string_literal: true

module BlocklistBuilder::Backends
  class Hosts < Backend
    attr_reader :path

    def initialize(path:, **params)
      super(**params)

      @path = path
    end

    def update_entries(entries)
      File.write(path, entries.map { |e| "0.0.0.0 #{e}" }.join("\n"))
    end
  end
end
