# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnote
  def to_ast
    NML::AST::Footnote.new(text_value,
                           input.line_of(interval.first),
                           input.column_of(interval.first))
  end
end
