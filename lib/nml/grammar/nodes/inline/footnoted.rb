# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnoted
  def to_ast
    footnotes.inject(inline.to_ast){ |inline, footnote| footnote.to_ast(inline) }
  end
end
