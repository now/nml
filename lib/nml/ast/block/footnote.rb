# -*- coding: utf-8 -*-

class NML::AST::Block::Footnote
  autoload :Link, 'nml/ast/block/footnote/link'

  def initialize(identifier, line, column, child)
    @identifier, @line, @column, @child = identifier, line, column, child
  end

  def ==(other)
    identifier == other.identifier and
      line == other.line and
      column == other.column and
      child == other.child
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    identifier.hash ^
      line.hash ^
      column.hash ^
      child.hash
  end

  def inspect
    '%s.new(%p, %p, %p, %p)' % [self.class, identifier, line, column, child]
  end

  attr_reader :identifier, :line, :column, :child
end
