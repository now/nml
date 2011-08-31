# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Quote.
           new(NML::AST::Block::Quote::Line.new('To clique, or not to clique, that is the question:')) do
    NML::Grammar::Parsers::Block::Quote4Parser.ast('      > To clique, or not to clique, that is the question:')
  end

  expect NML::AST::Block::Quote.
           new(NML::AST::Block::Quote::Line.new('To clique, or not to clique, that is the question:'),
               NML::AST::Block::Quote::Line.new('Whether ’tis nobler in the mind to suffer')) do
    NML::Grammar::Parsers::Block::Quote4Parser.ast("      > To clique, or not to clique, that is the question:\n      > Whether ’tis nobler in the mind to suffer")
  end

  expect NML::AST::Block::Quote.
           new(NML::AST::Block::Quote::Line.new('To clique, or not to clique, that is the question:'),
               NML::AST::Block::Quote::Line.new('Whether ’tis nobler in the mind to suffer')) do
    NML::Grammar::Parsers::Block::Quote4Parser.ast("      > To clique, or not to clique,\n        that is the question:\n      > Whether ’tis nobler in the mind to suffer")
  end

  expect NML::AST::Block::Quote.
           new(NML::AST::Block::Quote::Line.new('To clique, or not to clique, that is the question:'),
               NML::AST::Block::Quote::Attribution.new('Shakespeare')) do
    NML::Grammar::Parsers::Block::Quote4Parser.ast("      > To clique, or not to clique, that is the question:\n      — Shakespeare")
  end
end
