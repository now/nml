# -*- coding: utf-8 -*-

require 'nokogiri'

class NML::Output::NML
  def initialize(ast)
    @ast = ast
  end

  def call
    Nokogiri::XML::Builder.new{ |xml|
      output xml, @ast
    }.to_xml
  end

private

  def output(xml, node)
    case node
    when NML::AST::Code
      xml.code{
        children xml, node
      }
    when NML::AST::Document
      xml.nml{
        children xml, node
      }
    when NML::AST::Emphasis
      xml.emphasis{
        children xml, node
      }
    when NML::AST::Enumeration
      xml.enumeration{
        children xml, node
      }
    when NML::AST::Item
      xml.item{
        children xml, node
      }
    when NML::AST::Itemization
      xml.itemization{
        children xml, node
      }
    when NML::AST::Paragraph
      xml.p{
        children xml, node
      }
    when NML::AST::Section
      xml.section{
        children xml, node
      }
    when NML::AST::Title
      xml.title{
        children xml, node
      }
    when String
      xml.text node
    else
      raise TypeError, 'unknown node type: %p' % [node]
    end
  end

  def children(xml, node)
    node.each do |child|
      output xml, child
    end
  end
end
