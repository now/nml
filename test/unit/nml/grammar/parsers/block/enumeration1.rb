# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Enumeration.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A')),
               NML::AST::Item.new(NML::AST::Paragraph.new('B')),
               NML::AST::Item.new(NML::AST::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n₂   B\n₃   C")
  end

  expect NML::AST::Enumeration.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n    B\n    C")
  end

  expect NML::AST::Enumeration.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A B C')),
               NML::AST::Item.new(NML::AST::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Enumeration1Parser.ast("₁   A\n    B\n    C\n₂   D E F")
  end
end