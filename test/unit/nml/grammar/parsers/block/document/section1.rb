# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Section.new('Title') do
    NML::Grammar::Parsers::Block::Document::Section1Parser.ast("\n§ Title")
  end
end
