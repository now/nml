# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Block::Sections
  def to_ast
    empty? ? [] : elements.map{ |e| e.section.to_ast }
  end
end
