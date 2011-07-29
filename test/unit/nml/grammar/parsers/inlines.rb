# -*- coding: utf-8 -*-

Expectations do
  expect ['a'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a')
  end

  expect [NML::AST::Emphasis.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/')
  end

  expect [NML::AST::Emphasis.new('a'), 'b', NML::AST::Emphasis.new('c')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/b/c/')
  end

  expect ['a', NML::AST::Emphasis.new('b'), 'c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a/b/c')
  end
end
