# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Document.new('Title', []) do
    NML::Parser::NMLParser.ast('Title')
  end

  expect NML::AST::Document.new('Title', [
           NML::AST::Paragraph.new("Line1\nLine2"),
           NML::AST::Paragraph.new("Line21")]) do
    NML::Parser::NMLParser.ast("Title\n\n  Line1\n  Line2\n\n  Line21")
  end
end
