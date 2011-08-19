# -*- coding: utf-8 -*-

class NML::AST::Block::Footnotes < NML::AST::Node
  def [](identifier)
    find{ |footnote| footnote.identifier == identifier }
  end

  def defined?(identifier)
    not self[identifier].nil?
  end

  def identifiers
    map{ |footnote| footnote.identifier }
  end
end
