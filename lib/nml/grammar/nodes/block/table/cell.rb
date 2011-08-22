# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table::Cell
  def to_ast
    NML::AST::Block::Table::Cell.new(*inlines.to_ast)
  end
end
