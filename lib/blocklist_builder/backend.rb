# frozen_string_literal: true

module BlocklistBuilder
  class Backend
    attr_reader :name

    def self.new(type:, **params)
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
end
