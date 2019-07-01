# frozen_string_literal: true

require 'blocklist_builder/extensions'
require 'blocklist_builder/version'

module BlocklistBuilder
  class Error < StandardError; end

  autoload :Backend, 'blocklist_builder/backend'
  autoload :Source, 'blocklist_builder/source'
  autoload :SOURCES, 'blocklist_builder/sources'

  module Sources
    autoload :Plain, 'blocklist_builder/sources/plain'
    autoload :Regexp, 'blocklist_builder/sources/plain'
  end
end
