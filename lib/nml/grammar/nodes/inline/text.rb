# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Text < Treetop::Runtime::SyntaxNode
  def to_ast
    text_value
  end
end
