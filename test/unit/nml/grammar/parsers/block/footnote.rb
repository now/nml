# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Footnote.
           new('¹',
               NML::AST::Block::Footnote::Link.
                 new('Email me', 'mailto:example@example.com')) do
    NML::Grammar::Parsers::Block::FootnoteParser.ast('¹ Email me at mailto:example@example.com')
  end
end
