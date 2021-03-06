# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_caching/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_record_caching'
  spec.version       = ActiveRecordCaching::VERSION
  spec.authors       = ['Derek Lindahl']
  spec.email         = ['dlindahl@customink.com']
  spec.summary       = %q{Additonal caching logic for ActiveRecord for fast JSON APIs}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/dlindahl/active_record_caching'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end