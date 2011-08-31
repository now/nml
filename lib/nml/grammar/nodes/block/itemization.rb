# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Itemization < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Itemization.new(*([first.to_ast] + rest.elements.map{ |e| e.item.to_ast }))
  end
end
