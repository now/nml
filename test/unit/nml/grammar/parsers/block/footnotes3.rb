# -*- coding: utf-8 -*-

Expectations do
  expect [NML::AST::Block::Footnote.
            new('¹',
                NML::AST::Block::Footnote::Link.
                  new('Email me', 'mailto:example@example.com'))] do
    NML::Grammar::Parsers::Block::Footnotes3Parser.ast('    ¹ Email me at mailto:example@example.com')
  end

  expect [NML::AST::Block::Footnote.
            new('¹',
               NML::AST::Block::Footnote::Link.
                 new('Email me', 'mailto:example@example.com')),
          NML::AST::Block::Footnote.
            new('²',
                NML::AST::Block::Footnote::Link.
                  new('Visit me', 'http://example.com')),
        ] do
    NML::Grammar::Parsers::Block::Footnotes3Parser.ast("    ¹ Email me at mailto:example@example.com\n    ² Visit me at http://example.com")
  end
end
