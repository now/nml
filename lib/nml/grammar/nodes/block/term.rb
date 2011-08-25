# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Term < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Term.new(*inlines.to_ast)
  end
end
