# -*- coding: utf-8 -*-

class NML::AST::Itemization
  def initialize(*items)
    @items = items
  end

  def ==(other)
    items == other.items
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    items.hash
  end

  def inspect
    '#<%s %s>' % [self.class, items.map{ |item| item.inspect }.join(', ')]
  end

protected

  attr_reader :items
end
