# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Footnote < Treetop::Runtime::SyntaxNode
  autoload :Abbreviation, 'nml/grammar/nodes/block/footnote/abbreviation'
  autoload :Link, 'nml/grammar/nodes/block/footnote/link'

  def to_ast
    NML::AST::Block::Footnote.new(identifier.text_value,
                                  input.line_of(interval.first),
                                  input.column_of(interval.first),
                                  footnotedefinition.to_ast)
  end
end
