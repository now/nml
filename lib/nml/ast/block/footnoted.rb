# -*- coding: utf-8 -*-

class NML::AST::Block::Footnoted
  include NML::AST::Base

  def initialize(child, footnotes)
    super child, footnotes
  end

  def child
    children[0]
  end

  def footnotes
    children[1]
  end
end
