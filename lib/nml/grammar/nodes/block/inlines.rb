# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Inlines < Treetop::Runtime::SyntaxNode
  def to_ast
    ([first.to_ast] + rest.elements.map{ |e| e.inlines.to_ast }).
      flatten.
      reduce([]){ |a, e| String === e && String === a.last ? a.last << ' ' << e : a << e; a }.
      map{ |e| String === e ? e.gsub(/\s+/, ' ') : e }
  end
end
