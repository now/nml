# -*- coding: utf-8 -*-

Expectations do
  expect ['a'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a')
  end

  expect ['a', ' ', 'b'] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a b')
  end

  expect [NML::AST::Footnoted.new('a', NML::AST::Footnote.new('¹', 1, 2))] do
    NML::Grammar::Parsers::Inline::InlinesParser.ast('a¹')
  end
end
