# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "nobrainer-devise"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Viennot"]
  s.email       = ["nicolas@viennot.biz"]
  s.homepage    = "http://github.com/nviennot/nobrainer-devise"
  s.summary     = "NoBrainer adapter for Devise"
  s.description = "NoBrainer adapter for Devise"
  s.license     = 'MIT'

  s.add_dependency "devise",    ">= 3.2.2"
  s.add_dependency "nobrainer", ">= 0.9.1"

  s.files        = Dir["lib/**/*"] + ['README.md']
  s.require_path = 'lib'
  s.has_rdoc     = false
end
