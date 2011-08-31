# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Quote < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Quote.
      new(*([NML::AST::Block::Quote::Line.new(*first.to_ast)] +
            rest.elements.map{ |e| NML::AST::Block::Quote::Line.new(*e.inlines.to_ast) }))
  end
end
