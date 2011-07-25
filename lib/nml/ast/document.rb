# -*- coding: utf-8 -*-

class NML::AST::Document
  def initialize(title, paragraphs)
    @title, @paragraphs = title, paragraphs
  end

  def ==(other)
    title == other.title and paragraphs == other.paragraphs
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    title.hash ^ paragraphs.hash
  end

  def inspect
    '#<%s %s, %s>' % [self.class, title, paragraphs.map{ |p| p.inspect }.join(", ")]
  end

protected

  attr_reader :title, :paragraphs
end
