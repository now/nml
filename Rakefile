# -*- coding: utf-8 -*-

require 'lookout/rake/tasks'
require 'yard'

Lookout::Rake::Tasks::Test.new do |t|
  t.requires << 'test/lib/lookout/nokogiri'
end
Lookout::Rake::Tasks::Gem.new
Lookout::Rake::Tasks::Tags.new
YARD::Rake::YardocTask.new
