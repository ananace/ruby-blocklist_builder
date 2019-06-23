# frozen_string_literal: true

require File.join File.expand_path('lib', __dir__), 'blocklist_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'blocklist-builder'
  spec.version       = BlocklistBuilder::VERSION
  spec.authors       = ['Alexander Olofsson']
  spec.email         = ['ace@haxalot.com']

  spec.summary       = 'Summary goes here'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/ananace/blocklist-builder'
  spec.license       = 'MIT'

  spec.extra_rdoc_files = %w[README.md LICENSE.txt CHANGELOG.md]
  spec.files         = Dir['{bin,lib}/**/*'] + spec.extra_rdoc_files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'test-unit'

  spec.add_dependency 'logging', '~> 2'
end
