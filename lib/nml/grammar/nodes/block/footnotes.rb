# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Footnotes
  def to_ast
    elements.map{ |e| e.blockfootnote.to_ast }
  end
end