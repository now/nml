# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Definitions
  def to_ast
    NML::AST::Block::Definitions.new(*([first.to_ast] + rest.elements.map{ |e| e.definition.to_ast }))
  end
end
