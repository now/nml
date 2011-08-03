# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Item
  def to_ast
    NML::AST::Block::Item.new(*([first.to_ast] + (rest.empty? ? [] : rest.to_ast)))
  end
end
