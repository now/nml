# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Enumeration < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Enumeration.new(*elements.map{ |item| item.item1.to_ast })
  end
end
