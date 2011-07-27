# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    # TODO: This will have to be adjusted when we add other inlines.
    elements.
      map{ |e| e.text_value }.
      reject{ |e| e.empty? }.
      reduce([]){ |a, e| String === e and String === a.last ? a.last << e : a << e; a }.
      map{ |e| String === e ? e.gsub(/[ \n\t]+/, ' ') : e }
  end
end
