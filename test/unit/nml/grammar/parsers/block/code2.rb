# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Code.new('def id(a) a end') do
    NML::Grammar::Parsers::Block::Code2Parser.ast('      def id(a) a end')
  end

  expect NML::AST::Block::Code.new("def id(a)\n  a\nend") do
    NML::Grammar::Parsers::Block::Code2Parser.ast("      def id(a)\n        a\n      end")
  end
end