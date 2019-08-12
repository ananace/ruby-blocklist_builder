# frozen_string_literal: true

module BlocklistBuilder::Sources
  class Regexp < BlocklistBuilder::Source
    # Matches an entry in a hosts file;
    #
    #   0.0.0.0 fqdn.goes.here
    HOSTSLINE_REX = /^(?:\d+\.){3}\d+\s+([\w\-_.]+)/.freeze
    STRICT_HOSTSLINE_REX = /^0\.0\.0\.0\s+([\w\-_.]+)/.freeze

    attr_reader :regex, :template

    # @param [Regex,:strict,:hosts] regex A regular expression to used for
    #        matching entries, also accepts the names :hosts for hosts-file
    #        matching, and :strict for hosts-file matching which requires the
    #        IP to be 0.0.0.0.
    # @param [String] template The template to render entries as, can use regex
    #        capture groups with backslash.
    def initialize(regex: :hosts, template: '\1', **params)
      super

      if regex == :hosts
        regex = HOSTSLINE_REX
      elsif regex == :strict
        regex = STRICT_HOSTSLINE_REX
      end

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
