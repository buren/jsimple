# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsimple/version'

Gem::Specification.new do |spec|
  spec.name          = 'jsimple'
  spec.version       = Jsimple::VERSION
  spec.authors       = ['Jacob Burenstam']
  spec.email         = ['burenstam@gmail.com']

  spec.summary       = %q{Easy integration between (legacy) Rails apps, and JavaScript.}
  spec.description   = %q{Easy integration between (legacy) Rails apps, and JavaScript, the gem has makes few assumptions and has almost no dependencies.}
  spec.homepage      = 'https://github.com/buren/jsimple'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hot_reload_proxy', '~> 0.1'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'simplecov'
end
