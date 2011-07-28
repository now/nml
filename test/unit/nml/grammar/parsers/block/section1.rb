# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Section.new(NML::AST::Title.new('Title')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast('§ Title')
  end

  expect NML::AST::Section.new(NML::AST::Title.new('Title Second Line')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n  Second Line")
  end

  expect NML::AST::Section.
           new(NML::AST::Title.new('Title Second Line'),
               NML::AST::Paragraph.new('Line11 Line12')) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n  Second Line\n\n    Line11\n    Line12")
  end

  expect NML::AST::Section.
           new(NML::AST::Title.new('Title'),
               NML::AST::Paragraph.new('Line11 Line12'),
               NML::AST::Itemization.new(NML::AST::Paragraph.new('Item1'),
                                         NML::AST::Paragraph.new('Item2'))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  •   Item1\n  •   Item2")
  end

  expect NML::AST::Section.
           new(NML::AST::Title.new('Title'),
               NML::AST::Paragraph.new('Line11 Line12'),
               NML::AST::Enumeration.new(NML::AST::Paragraph.new('Item1'),
                                         NML::AST::Paragraph.new('Item2'))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  ₁   Item1\n  ₂   Item2")
  end

  expect NML::AST::Section.
           new(NML::AST::Title.new('Title'),
               NML::AST::Paragraph.new('Line11 Line12'),
               NML::AST::Section.new(NML::AST::Title.new('Title'))) do
    NML::Grammar::Parsers::Block::Section1Parser.ast("§ Title\n\n    Line11\n    Line12\n\n  § Title")
  end
end
