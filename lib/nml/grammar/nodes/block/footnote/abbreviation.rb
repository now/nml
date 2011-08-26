# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Footnote::Abbreviation < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Footnote::Abbreviation.new(definition.text_value)
  end
end
