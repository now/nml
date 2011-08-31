# -*- coding: utf-8 -*-

require 'treetop'

module NML
  autoload :AST, 'nml/ast'
  autoload :CLI, 'nml/cli'
  autoload :Grammar, 'nml/grammar'
  autoload :Normalization, 'nml/normalization'
  autoload :Output, 'nml/output'
  autoload :Validation, 'nml/validation'
  autoload :Version, 'nml/version'

  require 'nml/parser'

  DataPath = File.expand_path('../../data', __FILE__)

  def self.parse(string)
    Grammar::Parsers::Block::DocumentParser.new.parse(string)
  end

  def self.ast(string)
    Grammar::Parsers::Block::DocumentParser.ast(string)
  end
end
