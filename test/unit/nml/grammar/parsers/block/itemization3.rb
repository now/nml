# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Itemization.new(NML::AST::Paragraph.new('A'),
                                   NML::AST::Paragraph.new('B'),
                                   NML::AST::Paragraph.new('C')) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n    •   B\n    •   C")
  end

  expect NML::AST::Itemization.new(NML::AST::Paragraph.new('A B C')) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n      B\n      C")
  end

  expect NML::AST::Itemization.new(NML::AST::Paragraph.new('A B C'),
                                   NML::AST::Paragraph.new('D E F')) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n      B\n      C\n    •   D E F")
  end
end
