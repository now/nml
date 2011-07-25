# -*- coding: utf-8 -*-

class NML::AST::Paragraph
  def initialize(content)
    @content = content
  end

  def ==(other)
    content == other.content
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    content.hash
  end

  def inspect
    '#<%s %p>' % [self.class, content]
  end

protected

  attr_reader :content
end
