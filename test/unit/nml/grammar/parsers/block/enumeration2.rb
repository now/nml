# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Enumeration.new(NML::AST::Paragraph.new('A'),
                                   NML::AST::Paragraph.new('B'),
                                   NML::AST::Paragraph.new('C')) do
    NML::Grammar::Parsers::Block::Enumeration2Parser.ast("  ₁   A\n  ₂   B\n  ₃   C")
  end

  expect NML::AST::Enumeration.new(NML::AST::Paragraph.new('A B C')) do
    NML::Grammar::Parsers::Block::Enumeration2Parser.ast("  ₁   A\n    B\n    C")
  end

  expect NML::AST::Enumeration.new(NML::AST::Paragraph.new('A B C'),
                                   NML::AST::Paragraph.new('D E F')) do
    NML::Grammar::Parsers::Block::Enumeration2Parser.ast("  ₁   A\n    B\n    C\n  ₂   D E F")
  end
end
