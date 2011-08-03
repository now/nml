# -*- coding: utf-8 -*-

class NML::AST::Footnote
  def initialize(number, line, column)
    @number, @line, @column = number, line, column
  end

  def ==(other)
    number == other.number and line == other.line and column == other.column
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    number.hash ^ line.hash ^ column.hash
  end

  def inspect
    '%s.new(%s, %d, %d)' % [self.class, number, line, column]
  end

  attr_reader :number, :line, :column
end
