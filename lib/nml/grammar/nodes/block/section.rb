# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Section < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Section.new(*([title.to_ast] +
                            blocks.to_ast +
                            (sections.elements || []).map{ |e| e.section.to_ast }))
  end
end
