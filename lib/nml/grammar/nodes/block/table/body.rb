# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table::Body
  include Enumerable

  def each
    elements.each do |element|
      yield element.row
    end
    self
  end

  def to_ast
    NML::AST::Block::Table::Body.new(*elements.map{ |e| e.row.to_ast })
  end
end
