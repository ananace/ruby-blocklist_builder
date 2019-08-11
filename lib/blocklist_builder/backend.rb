# frozen_string_literal: true

module BlocklistBuilder
  class Backend
    attr_reader :name

    def self.create(type:, **params)
      klass = BlocklistBuilder::Backends.const_get(type.to_s.pascalcase.to_sym)

      klass.new(**params)
    end

    def initialize(name: nil)
      @name = name
    end

    def current_entries
      raise NotImplementedError
    end

    def update_entries(_entries)
      raise NotImplementedError
    end
  end

  module Backends
    autoload :Hosts, 'blocklist_builder/backends/hosts'
  end
end
