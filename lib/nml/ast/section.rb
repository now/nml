# -*- coding: utf-8 -*-

class NML::AST::Section
  def initialize(title)
    @title = title
  end

  def ==(other)
    title == other.title
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    title.hash
  end

  def inspect
    '#<%s %p>' % [self.class, title]
  end

protected

  attr_reader :title
end
