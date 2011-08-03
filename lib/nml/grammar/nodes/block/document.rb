# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Document < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Document.new(*([title.to_ast] +
                             blocks.to_ast +
                             sections.elements.map{ |e| e.section1.to_ast }))
  end
end
