# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title')) do
    NML::Grammar::Parsers::Block::DocumentParser.ast('Title')
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title')) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title of Two Lines')) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\nof Two Lines")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Paragraph.new('Line21')) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n  Line21")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Itemization.
                 new(NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item1')),
                     NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item2')))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n•   Item1\n•   Item2")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Enumeration.
                 new(NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item1')),
                     NML::AST::Block::Item.
                       new(NML::AST::Block::Paragraph.new('Item2')))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n₁   Item1\n₂   Item2")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.new('Line11 Line12'),
               NML::AST::Block::Section.
                 new(NML::AST::Block::Title.new('Title'))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n§ Title")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Footnoted.
                 new(NML::AST::Block::Paragraph.
                       new('Line11 ',
                           NML::AST::Inline::Footnote.new('¹', 4, 9, 'Line12')),
                     NML::AST::Block::Footnotes.
                       new(NML::AST::Block::Footnote.
                             new('¹', 6, 1,
                                 NML::AST::Block::Footnote::Link.
                                   new('Email me', 'mailto:example@example.com'))))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12¹\n\n¹ Email me at mailto:example@example.com")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Code.new("def id(a)\n  a\nend")) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n    def id(a)\n      a\n    end")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Table.
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
                                 NML::AST::Block::Table::Cell.new('4'))))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n| A | B |\n| 1 | 2 |\n| 3 | 4 |")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Section.
                new(NML::AST::Block::Title.new('Title'),
                    NML::AST::Block::Section.
                      new(NML::AST::Block::Title.new('Title')))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n§ Title\n\n  § Title")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Definitions.
                 new(NML::AST::Block::Item.
                       new(NML::AST::Block::Term.new('A'),
                           NML::AST::Block::Definition.
                             new(NML::AST::Block::Paragraph.new('1')))),
               NML::AST::Block::Paragraph.new('End')) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n= A\n    1\n\n  End")
  end

  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Footnoted.
                 new(NML::AST::Block::Section.
                       new(NML::AST::Block::Title.
                             new(NML::AST::Inline::Footnote.new('¹', 3, 8, 'Title'))),
                     NML::AST::Block::Footnotes.
                       new(NML::AST::Block::Footnote.
                             new('¹', 5, 1,
                                 NML::AST::Block::Footnote::Link.
                                   new('Email me', 'mailto:example@example.com'))))) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n§ Title¹\n\n¹ Email me at mailto:example@example.com")
  end
end
