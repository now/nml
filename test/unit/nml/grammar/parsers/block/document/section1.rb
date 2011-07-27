# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Section.new(NML::AST::Title.new('Title')) do
    NML::Grammar::Parsers::Block::Document::Section1Parser.ast('§ Title')
  end

  expect NML::AST::Section.new(NML::AST::Title.new('Title Second Line')) do
    NML::Grammar::Parsers::Block::Document::Section1Parser.ast("§ Title\n  Second Line")
  end
end
