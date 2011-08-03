# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Blocks
  def to_ast
    elements.map{ |e| e.block.to_ast }
  end
end
