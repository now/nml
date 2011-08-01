# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnoted
  def to_ast
    footnotes.empty? ?
      inline.to_ast :
      NML::AST::Footnoted.new(inline.to_ast,
                              *([footnotes.first] +
                                footnotes.rest.elements.map{ |e| e.footnote }).
                                map{ |e| e.to_ast })
  end
end
