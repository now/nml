# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Itemization.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A')),
               NML::AST::Item.new(NML::AST::Paragraph.new('B')),
               NML::AST::Item.new(NML::AST::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n•   B\n•   C")
  end

  expect NML::AST::Itemization.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n    B\n    C")
  end

  expect NML::AST::Itemization.
           new(NML::AST::Item.new(NML::AST::Paragraph.new('A B C')),
               NML::AST::Item.new(NML::AST::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n    B\n    C\n•   D E F")
  end

  expect NML::AST::Itemization.
           new(NML::AST::Item.
                 new(NML::AST::Paragraph.new('A B C'),
                     NML::AST::Itemization.
                       new(NML::AST::Item.new(NML::AST::Paragraph.new('D E F'))),
                     NML::AST::Paragraph.new('Ghi'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A
    B
    C

  •   D E F

    Ghi")
  end
end
