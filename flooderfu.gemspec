# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flooderfu/version'

Gem::Specification.new do |gem|
  gem.name          = "flooderfu"
  gem.version       = Flooderfu::VERSION
  gem.authors       = ["Marcus Geißler"]
  gem.email         = ["marcus3006@gmail.com"]
  gem.description   = %q{flooding devices with packets}
  gem.summary       = %q{script collection for flooding devices with different types of packets}
  gem.homepage      = "https://github.com/marcusg/flooderfu"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "pcaprub"
end
