# -*- coding: utf-8 -*-

class NML::AST::Inline::Footnote
  include NML::AST::Base

  def initialize(identifier, line, column, child)
    @identifier, @line, @column = identifier, line, column
    super child
  end

  def copy(child)
    super identifier, line, column, child
  end

  def ==(other)
    super and
      identifier == other.identifier and
      line == other.line and
      column == other.column
  end

  def hash
    super ^ identifier.hash ^ line.hash ^ column.hash
  end

  def inspect
    '%s.new(%p, %d, %d, %p)' % [self.class, identifier, line, column, child]
  end

  attr_reader :identifier, :line, :column
end
