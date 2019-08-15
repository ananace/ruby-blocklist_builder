# frozen_string_literal: true

module BlocklistBuilder::Backends
  class Hosts < BlocklistBuilder::Backend
    DEFAULT_SEPARATOR = '# --- Blocklist Builder ---'

    attr_reader :path, :separator

    def initialize(path:, separator: DEFAULT_SEPARATOR, **params)
      super(**params)

      @path = path
      @separator = separator
    end

    def current_entries
      @source ||= BlocklistBuilder::Sources::Regegxp.new(regex: :strict).tap do |s|
        s.instance_variable_set :@backend, self
        s.instance_eval do
          def raw_data
            @backend.post_separator.join "\n"
          end
        end
      end

      @source.entries
    end

    def update_entries(entries)
      entry_text = entries.map { |e| "0.0.0.0 #{e}" }.join("\n")

      entry_text = pre_separator.join("\n") + "\n\n#{separator}\n\n" + entry_text

      File.write(path, entry_text)
      @data = nil
    end

    private

    def data
      @data ||= File.readlines @path
    end

    def pre_separator
      data.take_while { |l| l != separator }
    end

    def post_separator
      data.skip_while { |l| l != separator }
    end
  end
end
