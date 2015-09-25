# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kujibiki/version'

Gem::Specification.new do |spec|
  spec.name          = "kujibiki"
  spec.version       = Kujibiki::VERSION
  spec.authors       = ["Naoki Shimizu"]
  spec.email         = ["hcs0035@gmail.com"]

  spec.summary       = %q{Allow Array#sample to return waighted results}
  spec.description   = %q{Allow Array#sample to return waighted results}
  spec.homepage      = "https://github.com/deme0607/kujibiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
