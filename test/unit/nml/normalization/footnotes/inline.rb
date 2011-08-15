# -*- coding: utf-8 -*-

Expectations do
  expect NML::AST::Block::Document.
           new(NML::AST::Block::Title.new('Title'),
               NML::AST::Block::Paragraph.
                 new(NML::AST::Inline::Link.new('Email me', 'mailto:example@example.com', 'Line11'))) do
    NML::Normalization::Footnotes::Inline.call(NML.ast("Title\n\n  Line11¹\n\n¹ Email me at mailto:example@example.com"))
  end
end
