# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Section < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Section.new(title.text_value.strip)
  end
end
