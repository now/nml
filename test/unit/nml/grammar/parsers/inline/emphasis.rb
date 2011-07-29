# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Emphasis.new('a') do
    NML::Grammar::Parsers::Inline::EmphasisParser.ast('/a/')
  end
end
