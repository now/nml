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

  expect NML::Parser::Error.new('table row has 1 cell too many; expected only 2', 3, 1) do
    NML::Grammar::Parsers::Block::Table1Parser.ast("| A | B |\n| 1 | 2 |\n| 3 | 4 | 5 |")
  end

  expect NML::Parser::Error.new('table row has 2 cells too many; expected only 2', 2, 1) do
    NML::Grammar::Parsers::Block::Table1Parser.ast("| A | B |\n| 1 | 2 | 3 | 4 |\n| 5 | 6 |")
  end

  expect NML::Parser::Error.new('table row is missing 1 cell; expected 2', 3, 1) do
    NML::Grammar::Parsers::Block::Table1Parser.ast("| A | B |\n| 1 | 2 |\n| 3 |")
  end

  expect NML::Parser::Error.new('table row is missing 2 cells; expected 3', 3, 1) do
    NML::Grammar::Parsers::Block::Table1Parser.ast("| A | B | C |\n| 1 | 2 | 3 |\n| 4 |")
  end
end
