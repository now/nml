# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote::Link
  def initialize(title, uri)
    @title, @uri = title, uri
  end

  def ==(other)
    self.class == other.class and title == other.title and uri == other.uri
  end

  alias eql? ==

  def hash
    title.hash ^ uri.hash
  end

  def inspect
    '%s.new(%p, %p)' % [self.class, title, uri]
  end

  attr_reader :title, :uri
end
