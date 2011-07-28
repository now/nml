# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Document < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Document.new(*([title] +
                             blocks.elements.map{ |e| e.block1 } +
                             sections.elements.map{ |e| e.section1 }).map{ |e| e.to_ast })
  end
end
