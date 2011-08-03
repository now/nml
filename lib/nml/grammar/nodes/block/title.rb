# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Title < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Title.new(*inlines.to_ast)
  end
end
