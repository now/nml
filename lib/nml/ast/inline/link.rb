# -*- coding: utf-8 -*-

class NML::AST::Inline::Link
  include NML::AST::Base

  def initialize(title, url, child)
    @title, @url = title, url
    super child
  end

  def copy(child)
    super title, url, child
  end

  def ==(other)
    super and
      title == other.title and
      url == other.url
  end

  def hash
    super ^ title.hash ^ url.hash
  end

  def inspect
    '%s.new(%p, %p, %s)' % [self.class, title, url, children.map{ |c| c.inspect }.join(', ')]
  end

  attr_reader :title, :url
end
