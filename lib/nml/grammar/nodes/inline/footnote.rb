# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnote
  def to_ast(child)
    NML::AST::Inline::Footnote.new(text_value,
                                   input.line_of(interval.first),
                                   input.column_of(interval.first),
                                   child)
  end
end
