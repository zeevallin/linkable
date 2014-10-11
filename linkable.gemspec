# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linkable/version'

Gem::Specification.new do |spec|
  spec.name          = "linkable"
  spec.version       = Linkable::VERSION
  spec.authors       = ["Philip Vieira"]
  spec.email         = ["philip@vallin.se"]
  spec.summary       = %q{Next generation ruby URL parser.}
  spec.description   = %q{Parsing libraries been getting outdated as the web evolve. Linkable takes a scalable approach supporting gTLDs, custom schemas and complex query parameters.}
  spec.homepage      = "https://github.com/zeeraw/linkable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "pry"
end
