# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Section < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Section.new(*([title.to_ast] + blocks.to_ast + sections.to_ast))
  end
end
