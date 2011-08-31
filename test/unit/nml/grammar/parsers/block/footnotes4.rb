# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Footnotes.
           new(NML::AST::Block::Footnote.
                 new('¹', 1, 7,
                     NML::AST::Block::Footnote::Link.
                       new('Email me', 'mailto:example@example.com'))) do
    NML::Grammar::Parsers::Block::Footnotes4Parser.ast('      ¹ Email me at mailto:example@example.com')
  end

  expect NML::AST::Block::Footnotes.
           new(NML::AST::Block::Footnote.
                 new('¹', 1, 7,
                     NML::AST::Block::Footnote::Link.
                       new('Email me', 'mailto:example@example.com')),
               NML::AST::Block::Footnote.
                 new('²', 2, 7,
                     NML::AST::Block::Footnote::Link.
                       new('Visit me', 'http://example.com'))) do
    NML::Grammar::Parsers::Block::Footnotes4Parser.ast("      ¹ Email me at mailto:example@example.com\n      ² Visit me at http://example.com")
  end
end
