# -*- coding: utf-8 -*-

class NML::AST::Block::Footnoted
  def initialize(child, *footnotes)
    @child, @footnotes = child, footnotes
  end

  def ==(other)
    child == other.child and footnotes == other.footnotes
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    child.hash ^ footnotes.hash
  end

  def inspect
    '%s.new(%p, %s)' % [self.class, child, footnotes.map{ |e| e.inspect }.join(', ')]
  end

  attr_reader :child, :footnotes
end
