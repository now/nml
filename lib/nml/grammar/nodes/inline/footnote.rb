# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnote
  def to_ast
    NML::AST::Footnote.new(text_value, interval.first)
  end
end
