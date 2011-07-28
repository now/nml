# -*- coding: utf-8 -*-

class NML::Parser::Error < StandardError
  def initialize(message, line = nil, column = nil)
    super message
    @line, @column = line, column
  end

  def to_s
    '%d:%d: %s' % [line, column, super]
  end

  attr_reader :line, :column
end
