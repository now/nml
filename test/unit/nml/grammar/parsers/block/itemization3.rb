# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n    •   B\n    •   C")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C'))) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n        B\n        C")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('A B C')),
               NML::AST::Block::Item.new(NML::AST::Block::Paragraph.new('D E F'))) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n        B\n        C\n    •   D E F")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('A'),
                     NML::AST::Block::Paragraph.new('B')),
               NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('C'))) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n\n        B\n    •   C")
  end

  expect NML::AST::Block::Itemization.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Paragraph.new('A'),
                     NML::AST::Block::Paragraph.new('B'))) do
    NML::Grammar::Parsers::Block::Itemization3Parser.ast("    •   A\n\n        B")
  end
end
