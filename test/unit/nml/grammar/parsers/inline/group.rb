# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Group.new('a') do
    NML::Grammar::Parsers::Inline::GroupParser.ast('{a}')
  end
end
