# -*- coding: utf-8 -*-

module NML::Grammar::Parsers::Block
  require 'nml/grammar/parsers/block/common'

  require 'nml/grammar/parsers/block/inlines3'
  require 'nml/grammar/parsers/block/paragraph3'
  require 'nml/grammar/parsers/block/item3'
  require 'nml/grammar/parsers/block/enumeration3'
  require 'nml/grammar/parsers/block/itemization3'

  require 'nml/grammar/parsers/block/inlines2'
  require 'nml/grammar/parsers/block/paragraph2'
  require 'nml/grammar/parsers/block/item2'
  require 'nml/grammar/parsers/block/enumeration2'
  require 'nml/grammar/parsers/block/itemization2'

  require 'nml/grammar/parsers/block/inlines1'
  require 'nml/grammar/parsers/block/paragraph1'
  require 'nml/grammar/parsers/block/item1'
  require 'nml/grammar/parsers/block/enumeration1'
  require 'nml/grammar/parsers/block/itemization1'

  require 'nml/grammar/parsers/block/section2'

  require 'nml/grammar/parsers/block/section1'

  require 'nml/grammar/parsers/block/document'
end
