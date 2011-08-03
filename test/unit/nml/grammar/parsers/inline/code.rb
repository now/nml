# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Inline::Code.new('a') do
    NML::Grammar::Parsers::Inline::CodeParser.ast('‹a›')
  end

  expect NML::AST::Inline::Code.new('a/b/c') do
    NML::Grammar::Parsers::Inline::CodeParser.ast('‹a/b/c›')
  end
end
