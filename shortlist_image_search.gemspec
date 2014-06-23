# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shortlist_image_search/version'

Gem::Specification.new do |spec|
  spec.name          = "shortlist_image_search"
  spec.version       = ShortlistImageSearch::VERSION
  spec.authors       = ["Iain McNulty"]
  spec.email         = ["iain@picturk.com"]
  spec.summary       = %q{Search Google for images on the shortlist to see if they appear anywhere on the internet.}
  spec.description   = %q{Search Google for images on the shortlist to see if they appear anywhere on the internet. Return a list of image URLs that have matches for further inspection.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
