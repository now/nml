# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Emphasis < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Inline::Emphasis.new(*inlines.to_ast)
  end
end
