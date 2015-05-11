# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphite/tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'graphite-tools'
  spec.version       = Graphite::Tools::VERSION
  spec.authors       = ['Chris Beer']
  spec.email         = ['chris@cbeer.info']

  spec.summary       = 'Tools for working with graphite'
  spec.homepage      = 'https://github.com/cbeer/graphite-tools'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'linefit'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
