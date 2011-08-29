# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table::Cell
  def to_ast
    NML::AST::Block::Table::Cell.new(*cellinlines.to_ast)
  end
end
