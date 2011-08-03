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
end
