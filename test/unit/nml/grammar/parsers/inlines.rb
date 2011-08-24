# -*- coding: utf-8 -*-

Expectations do
  expect ['a'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a')
  end

  expect [NML::AST::Inline::Emphasis.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/')
  end

  expect [NML::AST::Inline::Emphasis.new('a'),
          ' ',
          'b',
          ' ',
          NML::AST::Inline::Emphasis.new('c')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/ b /c/')
  end

  expect ['a', ' ', NML::AST::Inline::Emphasis.new('b'), ' ', 'c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a /b/ c')
  end

  expect [NML::AST::Inline::Code.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('‹a›')
  end

  expect ['a‹b›c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a‹b›c')
  end

  expect ['a/b/c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a/b/c')
  end

  expect ['a', ' ', NML::AST::Inline::Code.new('b/c/d'), ' ', 'e'] do
    NML::Grammar::Parsers::InlinesParser.ast('a ‹b/c/d› e')
  end

  expect [NML::AST::Inline::Emphasis.
            new('a', ' ', NML::AST::Inline::Code.new('b/c/d'), ' ', 'e')] do
    NML::Grammar::Parsers::InlinesParser.ast('/a ‹b/c/d› e/')
  end

  expect [NML::AST::Inline::Group.new('a')] do
    NML::Grammar::Parsers::InlinesParser.ast('{a}')
  end

  expect ['a', ' ', NML::AST::Inline::Group.new('b'), ' ', 'c'] do
    NML::Grammar::Parsers::InlinesParser.ast('a {b} c')
  end

  expect ['a',
          ' ',
          NML::AST::Inline::Emphasis.
            new('b', ' ', NML::AST::Inline::Group.new('c'), ' ', 'd'),
          ' ',
          'e'] do
    NML::Grammar::Parsers::InlinesParser.ast('a /b {c} d/ e')
  end

  expect [NML::AST::Inline::Footnote.
            new('¹', 1, 8, NML::AST::Inline::Group.new('a b c'))] do
    NML::Grammar::Parsers::InlinesParser.ast('{a b c}¹')
  end

  expect ['a|b'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a|b')
  end

  expect [NML::AST::Inline::Emphasis.new('a'), '', '.'] do
    NML::Grammar::Parsers::InlinesParser.ast('/a/.')
  end
end
