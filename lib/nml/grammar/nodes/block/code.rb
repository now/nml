# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Code < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Block::Code.new(([first.text_value] + rest.elements.map{ |e| e.line.text_value }).join("\n"))
  end
end
