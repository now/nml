# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote::Link
  def initialize(title, uri)
    @title, @uri = title, uri
  end

  def ==(other)
    title == other.title and uri == other.uri
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    title.hash ^ uri.hash
  end

  def inspect
    '%s.new(%p, %p)' % [self.class, title, uri]
  end

  attr_reader :title, :uri
end
