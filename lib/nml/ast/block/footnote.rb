# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote
  autoload :Link, 'nml/ast/block/footnote/link'

  def initialize(number, line, column, child)
    @number, @line, @column, @child = number, line, column, child
  end

  def ==(other)
    number == other.number and
      line == other.line and
      column == other.column and
      child == other.child
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    number.hash ^
      line.hash ^
      column.hash ^
      child.hash
  end

  def inspect
    '%s.new(%p, %p, %p, %p)' % [self.class, number, line, column, child]
  end

  attr_reader :number, :line, :column, :child
end
