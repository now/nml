# -*- coding: utf-8 -*-

module NML::Grammar::Nodes::Inline::Footnotes
  include Enumerable

  def each
    return self if empty?
    yield footnote
    rest.elements.each do |e|
      yield e.footnote
    end
    self
  end
end
