# -*- coding: utf-8 -*-

class NML::Parser::Error < StandardError
  def initialize(message, line = nil, column = nil)
    super message
    @line, @column = line, column
  end

  attr_reader :line, :column
end
