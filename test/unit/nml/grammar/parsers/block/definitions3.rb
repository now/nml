# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Definitions.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('A'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('1')))) do
    NML::Grammar::Parsers::Block::Definitions3Parser.ast("    = A\n        1")
  end

  expect NML::AST::Block::Definitions.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('A'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('1'))),
               NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('B'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('2')))) do
    NML::Grammar::Parsers::Block::Definitions3Parser.ast("    = A\n        1\n    = B\n        2")
  end

  expect NML::AST::Block::Definitions.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('A'),
                     NML::AST::Block::Term.new('B'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('1')))) do
    NML::Grammar::Parsers::Block::Definitions3Parser.ast("    = A\n    = B\n        1")
  end

  expect NML::AST::Block::Definitions.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('A B'),
                     NML::AST::Block::Term.new('C'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('1')))) do
    NML::Grammar::Parsers::Block::Definitions3Parser.ast("    = A\n      B\n    = C\n        1")
  end

  expect NML::AST::Block::Definitions.
           new(NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('A'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('1'))),
               NML::AST::Block::Item.
                 new(NML::AST::Block::Term.new('B'),
                     NML::AST::Block::Definition.
                       new(NML::AST::Block::Paragraph.new('2')))) do
    NML::Grammar::Parsers::Block::Definitions3Parser.ast("    = A\n        1\n\n    = B\n        2")
  end
end
