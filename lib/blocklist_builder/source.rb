# frozen_string_literal: true

require 'net/http'

module BlocklistBuilder
  class Source
    HOSTSLINE_REX = /^(?:\d+\.){3}\d+\s+([\w\-_.]+)/.freeze

    attr_reader :name, :description, :url, :regex, :template
    attr_accessor :enabled

    def self.new(type: :regexp, **params)
      klass = BlacklistBuilder::Sources.const_get(type.to_s.pascalcase.to_sym)

      klass.new(**params)
    end

    def initialize(name:, description: nil, url:)
      @name = name
      @description = description
      @url = url
    end

    def update!
      @entries = nil
      entries
    end

    def entries
      @entries ||= read_data
    end

    protected

    def read_data
      raise NotImplementedError
    end

    def raw_data
      Net::HTTP.get(URI(@url))
    end
  end
end
