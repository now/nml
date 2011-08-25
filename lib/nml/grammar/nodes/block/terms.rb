# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Terms
  def to_ast
    [first.to_ast] + rest.elements.map{ |e| e.term.to_ast }
  end
end
