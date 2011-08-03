# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n₂   B\n₃   C")
  end

  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n    B\n    C")
  end

  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n    B\n    C\n₂   D E F")
  end
end
