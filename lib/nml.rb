# -*- coding: utf-8 -*-

require 'treetop'

module NML
  autoload :AST, 'nml/ast'
  autoload :Grammar, 'nml/grammar'
  require 'nml/parser'

  def self.parse(string)
    Grammar::Parsers::Block::DocumentParser.new.parse(string)
  end
end
