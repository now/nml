# -*- coding: utf-8 -*-

class NML::AST::Inline::Footnote
  def initialize(identifier, line, column)
    @identifier, @line, @column = identifier, line, column
  end

  def ==(other)
    identifier == other.identifier and line == other.line and column == other.column
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    identifier.hash ^ line.hash ^ column.hash
  end

  def inspect
    '%s.new(%p, %d, %d)' % [self.class, identifier, line, column]
  end

  attr_reader :identifier, :line, :column
end
