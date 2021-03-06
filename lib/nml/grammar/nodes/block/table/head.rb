# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table::Head
  def count
    row.count
  end

  def to_ast
    NML::AST::Block::Table::Head.new(row.to_ast)
  end
end
