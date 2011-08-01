# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    ([first] + rest.elements.map{ |e| e.elements }).flatten.map{ |e| e.to_ast }
  end
end
