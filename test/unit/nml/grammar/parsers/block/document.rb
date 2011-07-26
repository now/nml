# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Document.new('Title', [], []) do
    NML::Grammar::Parsers::Block::DocumentParser.ast('Title')
  end

  expect NML::AST::Document.new('Title', [
           NML::AST::Paragraph.new("Line11\nLine12"),
           NML::AST::Paragraph.new("Line21")], []) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n  Line21")
  end

  expect NML::AST::Document.new('Title', [
           NML::AST::Paragraph.new("Line11\nLine12"),
           NML::AST::Paragraph.new('Line21')], [
           NML::AST::Section.new('Title')]) do
    NML::Grammar::Parsers::Block::DocumentParser.ast("Title\n\n  Line11\n  Line12\n\n  Line21\n\n§ Title")
  end
end
