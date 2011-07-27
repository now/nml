# -*- coding: utf-8 -*-

class NML::AST::Paragraph
  def initialize(*inlines)
    @inlines = inlines
  end

  def ==(other)
    inlines == other.inlines
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    inlines.hash
  end

  def inspect
    '#<%s %s>' % [self.class, inlines.join("")]
  end

protected

  attr_reader :inlines
end
