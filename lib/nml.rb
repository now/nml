# -*- coding: utf-8 -*-

require 'treetop'

module NML
  autoload :AST, 'nml/ast'
  autoload :Grammar, 'nml/grammar'
  autoload :Output, 'nml/output'
  require 'nml/parser'

  def self.parse(string)
    Grammar::Parsers::Block::DocumentParser.new.parse(string)
  end

  def self.ast(string)
    Grammar::Parsers::Block::DocumentParser.ast(string)
  end
end
