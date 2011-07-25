# -*- coding: utf-8 -*-

module NML::Parser
  require 'nml/parser/error'
  require 'nml/parser/extensions'

  require 'nml/parser/document'
  require 'nml/parser/paragraph'

  Treetop.load File.expand_path('../parser/nml.treetop', __FILE__)
end
