# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Paragraph.new('Abc') do
    NML::Grammar::Parsers::Block::Paragraph1Parser.ast('  Abc')
  end
end
