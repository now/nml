# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnotes
  def to_ast
    ([first] + rest.elements.map{ |e| e.footnote }).map{ |e| e.to_ast }
  end
end
