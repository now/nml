# -*- coding: utf-8 -*-

class NML::AST::Block::Table < NML::AST::Node
  autoload :Body, 'nml/ast/block/table/body'
  autoload :Cell, 'nml/ast/block/table/cell'
  autoload :Head, 'nml/ast/block/table/head'
  autoload :Row, 'nml/ast/block/table/row'

  children :head, :body
end
