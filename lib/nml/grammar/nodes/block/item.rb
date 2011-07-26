# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Item < Treetop::Runtime::SyntaxNode
  def to_ast
    NML::AST::Paragraph.new(([nonblankline] +
                             continuations.elements.map{ |c| c.nonblankline }).
                            map{ |l| l.text_value.strip }.
                            join("\n"))
  end
end
