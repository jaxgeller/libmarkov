# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'libmarkov/version'

Gem::Specification.new do |spec|
  spec.name          = "libmarkov"
  spec.version       = Libmarkov::VERSION
  spec.authors       = ["jaxgeller"]
  spec.email         = ["jacksongeller@gmail.com"]

  spec.summary       = "Ruby implementation of libmarkov"
  spec.homepage      = "https://github.com/jaxgeller/libmarkov"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
