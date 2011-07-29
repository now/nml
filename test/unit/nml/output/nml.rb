# -*- coding: utf-8 -*-

Expectations do
  expect xml{
    nml{
      title{
        text 'Title'
      }
    }
  } do
    NML::Output::NML.new(NML.ast('Title')).call
  end
end
