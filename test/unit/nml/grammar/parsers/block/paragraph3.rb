# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Paragraph.new('Abc') do
    NML::Grammar::Parsers::Block::Paragraph3Parser.ast('      Abc')
  end

  expect NML::AST::Block::Paragraph.new('Abc def') do
    NML::Grammar::Parsers::Block::Paragraph3Parser.ast("      Abc\n      def")
  end
end
