# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ecc/version"

Gem::Specification.new do |spec|
  spec.name          = "ecc"
  spec.version       = Ecc::VERSION
  spec.authors       = ["Chihiro Hasegawa"]
  spec.email         = ["pgm3rdlinuxor1000@gmail.com"]

  spec.summary       = %q{Elliptic Curve Cryptography for CTFer}
  spec.description   = %q{Elliptic Curve Cryptography for CTFer}
  spec.homepage      = "https://alicemacs.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
