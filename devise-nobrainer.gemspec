# encoding: utf-8
$:.unshift File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "devise-nobrainer"
  s.version     = "0.4.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nicolas Viennot"]
  s.email       = ["nicolas@viennot.biz"]
  s.homepage    = "http://github.com/nviennot/devise-nobrainer"
  s.summary     = "NoBrainer adapter for Devise"
  s.description = "NoBrainer adapter for Devise"
  s.license     = 'MIT'

  s.add_dependency "devise",    ">= 3.2.2"
  s.add_dependency "nobrainer", ">= 0.17.0"

  s.files        = Dir["lib/**/*"] + ['README.md']
  s.require_path = 'lib'
  s.has_rdoc     = false
end
