# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Definition < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Item.
      new(*(terms.to_ast +
            [NML::AST::Block::Definition.new(*definition.to_ast)]))
  end
end
