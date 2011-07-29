# -*- coding: utf-8 -*-

module NML::AST::Base
  include Enumerable

  def initialize(*children)
    @children = children
  end

  def each
    children.each do |child|
      yield child
    end
  end

  def ==(other)
    children == other.children
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    children.hash
  end

  def inspect
    '%s.new(%s)' % [self.class, children.map{ |c| c.inspect }.join(', ')]
  end

protected

  attr_reader :children
end