# -*- coding: utf-8 -*-

class NML::AST::Footnote
  def initialize(number, index)
    @number, @index = number, index
  end

  def ==(other)
    number == other.number and index == other.index
  end

  def eql?(other)
    self.class == other.class and self == other
  end

  def hash
    number.hash ^ index.hash
  end

  def inspect
    '%s.new(%s, %d)' % [self.class, number, index]
  end

  attr_reader :number, :index
end
