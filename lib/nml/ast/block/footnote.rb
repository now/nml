# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote < NML::AST::Node
  autoload :Abbreviation, 'nml/ast/block/footnote/abbreviation'
  autoload :Link, 'nml/ast/block/footnote/link'

  attributes :identifier, :line, :column
  children :definition
end
