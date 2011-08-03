# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Group < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Inline::Group.new(*inlines.to_ast)
  end
end
