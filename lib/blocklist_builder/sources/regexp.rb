# frozen_string_literal: true

module BlocklistBuilder::Sources
  class Regexp < BlocklistBuilder::Source
    attr_reader :regex, :template

    def initialize(regex: HOSTSLINE_REX, template: '\1', **params)
      super

      @regex = regex
      @template = template
    end

    protected

    def read_data
      raw_data
        .split("\n")
        .map do |line|
          next unless @regex.match? line

          line.gsub(@regex, @template)
        end
        .compact
    end
  end
end
