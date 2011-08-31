# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Enumeration3Parser.ast("    ₁   A\n    ₂   B\n    ₃   C")
  end

  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Enumeration3Parser.ast("    ₁   A\n        B\n        C")
  end

  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Enumeration3Parser.ast("    ₁   A\n        B\n        C\n    ₂   D E F")
  end

  expect NML::AST::Block::Enumeration.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('A'),
                     NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Enumeration3Parser.ast("    ₁   A\n\n        B\n    ₂   C")
  end
end
