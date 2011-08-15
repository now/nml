# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Footnotes
  def to_ast
    NML::AST::Block::Footnotes.new(*elements.map{ |e| e.blockfootnote.to_ast })
  end
end
