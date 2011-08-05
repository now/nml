# -*- coding: utf-8 -*-

Expectations do
  expect NML::Validation::Error.new('footnote not defined: ¹', 3, 9) do
    NML::Validation::Footnotes.new(NML.ast("Title\n\n  Line11¹")).call
  end

  expect NML::Validation::Error.new('footnote not referenced: ¹', 5, 1) do
    NML::Validation::Footnotes.new(NML.ast("Title\n\n  Line11\n\n¹ Email me at mailto:example@example.com")).call
  end
end
