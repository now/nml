# -*- coding: utf-8 -*-

module NML::Grammar::Nodes
  autoload :Block, 'nml/grammar/nodes/block'
  autoload :Inline, 'nml/grammar/nodes/inline'

  class << self
    def normalize(inlines)
      inlines.reduce([]){ |result, inline|
        String === inline && String === result.last ?
          result.last << ' ' << inline :
          result << inline
        result
      }.map{ |inline| String === inline ? inline.gsub(/\s+/, ' ') : inline }
    end
  end
end
