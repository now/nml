# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n•   B\n•   C")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n    B\n    C")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A\n    B\n    C\n•   D E F")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('A B C'),
                     NML::AST::Block::Itemization.
                       new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('D E F'))),
                     NML::AST::Block::Paragraph.new('Ghi'))) do
    NML::Grammar::Parsers::Block::Itemization1Parser.ast("•   A
    B
    C

  •   D E F

    Ghi")
  end
end
