# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast('§ Title')
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title Second Line')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n  Second Line")
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title Second Line'),
               NML::AST::Block::Paragraph.new('Line11 Line12')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n  Second Line\n\n    Line11\n    Line12")
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Itemization.
                 new(NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item1')),
                     NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item2')))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  •   Item1\n  •   Item2")
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Enumeration.
                 new(NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item1')),
                     NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item2')))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  ₁   Item1\n  ₂   Item2")
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Section.
                 new(NML::AST::Block::Title.new('Title'))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  § Title")
  end

  expect NML::AST::Block::Section.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Footnoted.
                 new(NML::AST::Block::Paragraph.
                       new('Line11 ',
                           NML::AST::Inline::Footnoted.
                             new('Line12',
                                 NML::AST::Inline::Footnote.new('¹', 4, 11))),
                     NML::AST::Block::Footnote.
                       new('¹', 6, 3,
                           NML::AST::Block::Footnote::Link.
                             new('Email me', 'mailto:example@example.com')))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12¹\n\n  ¹ Email me at mailto:example@example.com")
  end
end
