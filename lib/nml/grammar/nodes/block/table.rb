# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table
  autoload :Body, 'nml/grammar/nodes/block/table/body'
  autoload :Cell, 'nml/grammar/nodes/block/table/cell'
  autoload :Head, 'nml/grammar/nodes/block/table/head'
  autoload :Row, 'nml/grammar/nodes/block/table/row'

  def to_ast
    NML::AST::Block::Table.new(head.to_ast, body.to_ast)
  end
end
