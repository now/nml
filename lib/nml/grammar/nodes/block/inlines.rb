# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::Grammar::Nodes.normalize(([first.to_ast] + rest.elements.map{ |e| [' '] + e.inlines.to_ast }).flatten)
  end
end
