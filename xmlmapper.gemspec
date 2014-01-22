# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xmlmapper/version'

Gem::Specification.new do |spec|
  spec.name          = "xmlmapper"
  spec.version       = Xmlmapper::VERSION
  spec.authors       = ["na_o_sss"]
  spec.email         = ["naoyoshi0511@gmail.com"]
  spec.summary       = %q{object xml mapper}
  spec.description   = %q{mapping xml to object}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
