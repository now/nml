# -*- coding: utf-8 -*-

Expectations do
  expect ['a b c'] do
    NML::Grammar::Nodes.normalize(['a   ', 'b', '   c'])
  end
end
