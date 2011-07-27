# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Paragraph < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Paragraph.new(*inlines1.to_ast)
  end
end
