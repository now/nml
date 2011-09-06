# -*- coding: utf-8 -*-

Expectations do
  expect 'Title' do
    NML::Output::NMC.new(NML.ast('Title')).call
  end

  expect "Title\n\n  Line11" do
    NML::Output::NMC.new(NML.ast("Title\n\n  Line11")).call
  end

  expect "Title\n\n  Line11 Line12" do
    NML::Output::NMC.new(NML.ast("Title\n\n  Line11\n  Line12")).call
  end

  expect "Title\n\n•   Item" do
    NML::Output::NMC.new(NML.ast("Title\n\n•   Item")).call
  end

  expect "Title\n\n₁   Item" do
    NML::Output::NMC.new(NML.ast("Title\n\n₁   Item")).call
  end

  expect "Title\n\n  Line11\n\n§ Title\n\n    Line21" do
    NML::Output::NMC.new(NML.ast("Title\n\n  Line11\n\n§ Title\n\n    Line21")).call
  end

  expect "Title\n\n    Line11\n    Line12" do |o|
    NML::Output::NMC.new(NML.ast(o)).call
  end
end
