# -*- coding: utf-8 -*-

require 'treetop'

module NML
  require 'nml/ast'
  require 'nml/parser'

  def self.parse(string)
    Parser::NMLParser.new.parse(string)
  end
end
