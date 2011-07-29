# -*- coding: utf-8 -*-

require 'nokogiri'

class Lookout::Expectations
  undef xml

  def xml(&block)
    Nokogiri::XML::Builder.new(&block).to_xml
  end
end
