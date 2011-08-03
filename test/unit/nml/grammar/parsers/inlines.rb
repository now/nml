# -*- coding: utf-8 -*-

Expectations do
  expect ['a'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a')
  end

  expect [NML::AST::Emphasis.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/')
  end

  expect [NML::AST::Emphasis.new('a'), ' ', 'b', ' ', NML::AST::Emphasis.new('c')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/ b /c/')
  end

  expect ['a', ' ', NML::AST::Emphasis.new('b'), ' ', 'c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a /b/ c')
  end

  expect [NML::AST::Code.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('‹a›')
  end

  expect ['a‹b›c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a‹b›c')
  end

  expect ['a', ' ', NML::AST::Code.new('b/c/d'), ' ', 'e'] do
    NML::Grammar::Parsers::InlinesParser.ast('a ‹b/c/d› e')
  end

  expect [NML::AST::Emphasis.new('a', ' ', NML::AST::Code.new('b/c/d'), ' ', 'e')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a ‹b/c/d› e/')
  end

  expect [NML::AST::Group.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('{a}')
  end

  expect ['a', ' ', NML::AST::Group.new('b'), ' ', 'c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a {b} c')
  end

  expect ['a', ' ', NML::AST::Emphasis.new('b', ' ', NML::AST::Group.new('c'), ' ', 'd'), ' ', 'e'] do
    NML::Grammar::Parsers::InlinesParser.ast('a /b {c} d/ e')
  end

  expect [NML::AST::Footnoted.new(NML::AST::Group.new('a', ' ', 'b', ' ', 'c'),
                                  NML::AST::Footnote.new('¹', 1, 8))] do
    NML::Grammar::Parsers::InlinesParser.ast('{a b c}¹')
  end
end
