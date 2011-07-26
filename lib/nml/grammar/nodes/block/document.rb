# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Document < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Document.new(title.text_value.strip,
                           paragraphs.elements.map{ |p| p.to_ast },
                           sections.elements.map{ |s| s.to_ast })
  end
end
