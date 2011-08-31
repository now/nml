# -*- coding: utf-8 -*-

class NML::AST::Block::Quote < NML::AST::Node
  autoload :Attribution, 'nml/ast/block/quote/attribution'
  autoload :Line, 'nml/ast/block/quote/line'
end
