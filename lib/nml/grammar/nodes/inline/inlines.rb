# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Inlines
  def to_ast
    ([first] + rest.elements.map{ |e| e.elements }).flatten.map{ |e| e.to_ast }
  end
end
