# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Paragraph.new('Abc') do
    NML::Grammar::Parsers::Block::Paragraph2Parser.ast('    Abc')
  end

  expect NML::AST::Paragraph.new('Abc def') do
    NML::Grammar::Parsers::Block::Paragraph2Parser.ast("    Abc\n    def")
  end
end
