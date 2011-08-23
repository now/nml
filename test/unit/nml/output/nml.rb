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

  expect xml{
    nml{
      title{
        text 'Title'
      }
      p_{
        ref(:title => 'Email me', :uri => 'mailto:example@example.com'){
          text 'Drop me a line!'
        }
      }
    }
  } do
    NML::Output::NML.call(NML.ast("Title\n\n  {Drop me a line!}¹\n\n¹ Email me at mailto:example@example.com"))
  end
end
