# -*- coding: utf-8 -*-

require 'lookout/rake/tasks'
require 'yard'

Lookout::Rake::Tasks::Test.new do |t|
  t.requires << 'test/lib/lookout/nokogiri'
end
Lookout::Rake::Tasks::Gem.new
Lookout::Rake::Tasks::Tags.new
YARD::Rake::YardocTask.new

treetops = %w[
  lib/nml/grammar/parsers/block/blocks2.treetop
  lib/nml/grammar/parsers/block/blocks3.treetop
  lib/nml/grammar/parsers/block/code1.treetop
  lib/nml/grammar/parsers/block/code2.treetop
  lib/nml/grammar/parsers/block/code3.treetop
  lib/nml/grammar/parsers/block/common.treetop
  lib/nml/grammar/parsers/block/document.treetop
  lib/nml/grammar/parsers/block/enumeration1.treetop
  lib/nml/grammar/parsers/block/enumeration2.treetop
  lib/nml/grammar/parsers/block/enumeration3.treetop
  lib/nml/grammar/parsers/block/footnote.treetop
  lib/nml/grammar/parsers/block/footnotedefinition.treetop
  lib/nml/grammar/parsers/block/footnotes1.treetop
  lib/nml/grammar/parsers/block/footnotes2.treetop
  lib/nml/grammar/parsers/block/footnotes3.treetop
  lib/nml/grammar/parsers/block/inlines1.treetop
  lib/nml/grammar/parsers/block/inlines2.treetop
  lib/nml/grammar/parsers/block/inlines3.treetop
  lib/nml/grammar/parsers/block/inlines4.treetop
  lib/nml/grammar/parsers/block/item1.treetop
  lib/nml/grammar/parsers/block/item2.treetop
  lib/nml/grammar/parsers/block/item3.treetop
  lib/nml/grammar/parsers/block/itemization1.treetop
  lib/nml/grammar/parsers/block/itemization2.treetop
  lib/nml/grammar/parsers/block/itemization3.treetop
  lib/nml/grammar/parsers/block/paragraph1.treetop
  lib/nml/grammar/parsers/block/paragraph2.treetop
  lib/nml/grammar/parsers/block/paragraph3.treetop
  lib/nml/grammar/parsers/block/row.treetop
  lib/nml/grammar/parsers/block/section1.treetop
  lib/nml/grammar/parsers/block/section2.treetop
  lib/nml/grammar/parsers/block/table1.treetop
  lib/nml/grammar/parsers/block/table2.treetop
  lib/nml/grammar/parsers/block/table3.treetop
  lib/nml/grammar/parsers/inline/code.treetop
  lib/nml/grammar/parsers/inline/emphasis.treetop
  lib/nml/grammar/parsers/inline/group.treetop
  lib/nml/grammar/parsers/inline/inlines.treetop
  lib/nml/grammar/parsers/inlines.treetop]

treetops.each do |t|
  file t.sub(/\.treetop\z/, '.rb') => [t]
end

rule '.rb' => ['.treetop'] do |t|
  require 'treetop' unless defined? Treetop
  when_writing 'tt %s' % t.source do
    puts 'tt %s' % t.source if verbose
    Treetop::Compiler::GrammarCompiler.new.compile(t.source)
  end
end

task :default => treetops.map{ |t| t.sub(/\.treetop\z/, '.rb') }
