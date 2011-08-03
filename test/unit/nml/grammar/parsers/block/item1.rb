# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Item.
           new(NML::AST::Block::Paragraph.new('First Second'),
               NML::AST::Block::Paragraph.new('Second')) do
    NML::Grammar::Parsers::Block::Item1Parser.ast("First\n    Second\n\n    Second")
  end
end
