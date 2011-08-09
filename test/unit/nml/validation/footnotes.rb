# -*- coding: utf-8 -*-

Expectations do
  expect NML::Validation::Error.new('footnote not defined: ¹', 3, 9) do
    NML::Validation::Footnotes.call(NML.ast("Title\n\n  Line11¹"))
  end

  expect NML::Validation::Error.new('footnote not referenced: ¹', 5, 1) do
    NML::Validation::Footnotes.call(NML.ast("Title\n\n  Line11\n\n¹ Email me at mailto:example@example.com"))
  end

  expect NML.ast("Title\n\n  Line11¹\n\n¹ Email me at mailto:example@example.com") do |ast|
    NML::Validation::Footnotes.call(ast)
  end

  expect NML.ast("Title\n\n•   Item11\n\n    Item12¹\n\n¹ Email me at mailto:example@example.com") do |ast|
    NML::Validation::Footnotes.call(ast)
  end
end
