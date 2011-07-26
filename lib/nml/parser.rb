# -*- coding: utf-8 -*-

module NML::Parser
  autoload :Error, 'nml/parser/error'
  autoload :Extensions, 'nml/parser/extensions'
end

class Treetop::Runtime::CompiledParser
  extend NML::Parser::Extensions
end
