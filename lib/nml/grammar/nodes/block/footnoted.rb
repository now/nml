# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Footnoted
  def to_ast
    footnotes.empty? ?
      block.to_ast :
      NML::AST::Block::Footnoted.new(block.to_ast, *footnotes.footnotes.to_ast)
  end
end
