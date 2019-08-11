# frozen_string_literal: true

module BlocklistBuilder::Backends
  class Hosts < BlocklistBuilder::Backend
    attr_reader :path

    def initialize(path:, **params)
      super(**params)

      @path = path
    end

    def current_entries
      @source ||= BlocklistBuilder::Source.create(type: :regexp, name: name, url: 'file:///dev/null').tap do |source|
        source.instance_variable_set :@source_path, @path
        source.instance_eval do
          def raw_data
            File.read(@source_path)
          end
        end
      end

      @source.entries
    end

    def update_entries(entries)
      File.write(path, entries.map { |e| "0.0.0.0 #{e}" }.join("\n"))
    end
  end
end
