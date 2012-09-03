# -*- encoding: utf-8 -*-
require File.expand_path('../lib/flooderfu/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcus Geißler"]
  gem.email         = ["marcus3006@gmail.com"]
  gem.description   = %q{flooding devices with packets}
  gem.summary       = %q{script collection for flooding devices with different types of packets}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "flooderfu"
  gem.require_paths = ["lib"]
  gem.version       = Flooderfu::VERSION
end
