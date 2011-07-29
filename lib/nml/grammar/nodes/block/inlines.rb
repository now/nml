# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    ([first] + rest.elements.map{ |e| e.inlines }).
      map{ |e| e.to_ast }.
      flatten.
      reduce([]){ |a, e| String === e && String === a.last ? a.last << ' ' << e : a << e; a }.
      map{ |e| String === e ? e.gsub(/[ \n\t]+/, ' ') : e }
  end
end
