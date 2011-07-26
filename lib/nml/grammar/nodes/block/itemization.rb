# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Itemization < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Itemization.new(*items.elements.map{ |item| item.item1.to_ast })
  end
end
