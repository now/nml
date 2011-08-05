# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote
  autoload :Link, 'nml/ast/block/footnote/link'

  def initialize(number, child)
    @number, @child = number, child
  end

  def ==(other)
    number == other.number and child == other.child
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    number.hash ^ child.hash
  end

  def inspect
    '%s.new(%p, %p)' % [self.class, number, child]
  end

  attr_reader :number, :child
end
