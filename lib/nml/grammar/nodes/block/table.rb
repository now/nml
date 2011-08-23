# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Table
  autoload :Body, 'nml/grammar/nodes/block/table/body'
  autoload :Cell, 'nml/grammar/nodes/block/table/cell'
  autoload :Head, 'nml/grammar/nodes/block/table/head'
  autoload :Row, 'nml/grammar/nodes/block/table/row'

  def to_ast
    overlong = body.find{ |row| row.count > head.count } and
      raise NML::Parser::Error.
        new((overlong.count - head.count > 1 ?
             'table row has %d cells too many; expected only %d' :
             'table row has %d cell too many; expected only %d') %
              [overlong.count - head.count, head.count],
            overlong.line, overlong.column)
    undershort = body.find{ |row| row.count < head.count } and
      raise NML::Parser::Error.
        new((head.count - undershort.count > 1 ?
             'table row is missing %d cells; expected %d' :
             'table row is missing %d cell; expected %d') %
              [head.count - undershort.count, head.count],
            undershort.line, undershort.column)
    NML::AST::Block::Table.new(head.to_ast, body.to_ast)
  end
end
