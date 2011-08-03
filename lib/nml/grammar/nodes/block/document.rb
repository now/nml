# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Document < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Document.new(*([title.to_ast] + blocks.to_ast + sections.to_ast))
  end
end
