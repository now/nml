# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Inline::Code < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Code.new(*unparsed.to_ast)
  end
end
