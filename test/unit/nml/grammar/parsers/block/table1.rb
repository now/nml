# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Table.
           new(NML::AST::Block::Table::Head.
                 new(NML::AST::Block::Table::Row.
                       new(NML::AST::Block::Table::Cell.new('A'),
                           NML::AST::Block::Table::Cell.new('B'))),
               NML::AST::Block::Table::Body.
                 new(NML::AST::Block::Table::Row.
                       new(NML::AST::Block::Table::Cell.new('1'),
                           NML::AST::Block::Table::Cell.new('2')),
                     NML::AST::Block::Table::Row.
                       new(NML::AST::Block::Table::Cell.new('3'),
                           NML::AST::Block::Table::Cell.new('4')))) do
    NML::Grammar::Parsers::Block::Table1Parser.ast("| A | B |\n| 1 | 2 |\n| 3 | 4 |")
  end
end
