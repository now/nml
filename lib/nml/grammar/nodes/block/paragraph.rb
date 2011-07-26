# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Paragraph < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Paragraph.new(elements.map{ |l| l.nonblankline.text_value.strip }.join("\n"))
  end
end
