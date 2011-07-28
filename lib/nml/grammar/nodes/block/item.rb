# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Item < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Item.new(*([first] +
                         (rest.elements || []).map{ |e| e.block }).
                         map{ |e| e.to_ast })
  end
end
