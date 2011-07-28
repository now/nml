# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Item.
           new(NML::AST::Paragraph.new('First Second'),
               NML::AST::Paragraph.new('Second')) do
    NML::Grammar::Parsers::Block::Item1Parser.ast("First\n    Second\n\n    Second")
  end
end
