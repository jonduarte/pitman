# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "pitman"
  spec.version       = "0.0.1"
  spec.authors       = ["Jonathan Duarte"]
  spec.email         = ["jonathan.duarte@rocketmail.com"]
  spec.summary       = %q{A simple command line tool to help users find unused gems.}
  spec.description   = %q{A simple command line tool to help users find unused gems.}
  spec.homepage      = "http://github.com/jonduarte/pitman"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "cutest", "~> 1.2"
end
