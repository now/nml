# -*- coding: utf-8 -*-

class NML::Grammar::Nodes::Block::Title < NML::Grammar::Nodes::Block::Inlines
  def to_ast
    NML::AST::Title.new(*super)
  end
end
