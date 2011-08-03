# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnoted
  def to_ast
    footnotes.empty? ?
      inline.to_ast :
      NML::AST::Footnoted.new(inline.to_ast, *footnotes.to_ast)
  end
end
