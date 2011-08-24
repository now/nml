# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Table::Row < Treetop::Runtime::SyntaxNode
  def count
    cells.elements.count
  end

  def line
    input.line_of(interval.first)
  end

  def column
    input.column_of(interval.first)
  end

  def to_ast
    NML::AST::Block::Table::Row.new(*cells.elements.map{ |e| e.cell.to_ast })
  end
end
