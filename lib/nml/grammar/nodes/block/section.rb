# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Section < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Section.new(*([title] +
                            blocks.elements.map{ |e| e.block } +
                            (sections.elements || []).map{ |e| e.section }).
                            map{ |e| e.to_ast })
  end
end
