# -*- coding: utf-8 -*-

class NML::Parser::Paragraph < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Paragraph.new(lines.elements.map{ |l| l.nonblankline.text_value.strip }.join("\n"))
  end
end
