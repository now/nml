# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    elements.map{ |e| e.to_ast }
  end
end
