# -*- coding: utf-8 -*-

$:.unshift File.expand_path('../lib', __FILE__)

require 'nml/version'

Gem::Specification.new do |s|
  s.name = 'nml'
  s.version = NML::Version

  s.author = 'Nikolai Weibull'
  s.email = 'now@bitwi.se'
  s.homepage = 'http://github.com/now/nml'

  s.description = IO.read(File.expand_path('../README', __FILE__))
  s.summary = s.description[/^[[:alpha:]]+.*?\./]

  s.files = Dir['{lib,test}/**/*.rb'] + %w[README Rakefile]

  s.add_runtime_dependency 'nokogiri', '~> 1.5'

  s.add_development_dependency 'lookout', '~> 2.0'
  s.add_development_dependency 'rbtags', '~> 0.1.0'
  s.add_development_dependency 'treetop', '~> 1.4.10'
  s.add_development_dependency 'yard', '~> 0.6.0'
end
