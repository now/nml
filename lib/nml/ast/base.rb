# -*- coding: utf-8 -*-

module NML::AST::Base
  include Enumerable

  def initialize(*children)
    @children = children
  end

  def copy(*children)
    children == @children ? self : self.class.new(*children)
  end

  def each
    children.each do |child|
      yield child
    end
    self
  end

  def ==(other)
    self.class == other.class and children == other.children
  end

  alias eql? ==

  def hash
    children.hash
  end

  def inspect
    '%s.new(%s)' % [self.class, children.map{ |c| c.inspect }.join(', ')]
  end

protected

  attr_reader :children
end
