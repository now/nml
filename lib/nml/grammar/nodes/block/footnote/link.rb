# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Footnote::Link < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Footnote::Link.new(title.text_value, uri.text_value)
  end
end
